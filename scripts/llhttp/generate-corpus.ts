#!/usr/bin/env -S node --import tsx

import assert from 'node:assert/strict';
import fs from 'node:fs';
import path from 'node:path';
import vm from 'node:vm';
import { MDGator, type Group, type Test } from 'mdgator';

function coilString(value: string): string {
  let out = '"';
  for (const byte of Buffer.from(value)) {
    if (byte === 0x22) out += '\\"';
    else if (byte === 0x5c) out += '\\\\';
    else if (byte === 0x0a) out += '\\n';
    else if (byte === 0x0d) out += '\\r';
    else if (byte === 0x09) out += '\\t';
    else if (byte >= 0x20 && byte <= 0x7e) out += String.fromCharCode(byte);
    else out += `\\x${byte.toString(16).padStart(2, '0')}`;
  }
  return out + '"';
}

function wireInput(raw: string): string {
  let input = raw.replace(/\n$/, '');
  input = input.replace(/\\(\r\n|\r|\n)/g, '');
  input = input.replace(/\r\n|\r|\n/g, '\r\n');
  input = input.replace(/\\r/g, '\r').replace(/\\n/g, '\n');
  input = input.replace(/\\t/g, '\t').replace(/\\f/g, '\f');
  input = input.replace(/\\x([0-9a-fA-F]+)/g,
    (_, hex: string) => String.fromCharCode(parseInt(hex, 16)));
  input = input.replace(/\\([0-7]{1,3})/g,
    (_, octal: string) => String.fromCharCode(parseInt(octal, 8)));
  return input.replace(/\$\{(.+?)\}/g,
    (_, code: string) => String(vm.runInNewContext(code)));
}

function collect(group: Group, out: Test[]): void {
  for (const child of group.children) collect(child, out);
  out.push(...group.tests);
}

const upstream = path.resolve(process.argv[2] ?? '');
const output = path.resolve(process.argv[3] ?? '');
if (process.argv.length !== 4) {
  throw new Error('usage: generate-corpus.ts UPSTREAM_LLHTTP OUTPUT.coil');
}
const pkg = JSON.parse(fs.readFileSync(path.join(upstream, 'package.json'), 'utf8'));
assert.equal(pkg.version, '9.4.3');

const files = [
  'request/sample', 'request/lenient-headers',
  'request/lenient-header-value-relaxed', 'request/lenient-version',
  'request/method', 'request/uri', 'request/connection',
  'request/content-length', 'request/transfer-encoding', 'request/invalid',
  'request/finish', 'request/pipelining', 'response/sample',
  'response/connection', 'response/content-length',
  'response/transfer-encoding', 'response/invalid', 'response/finish',
  'response/lenient-version', 'response/pipelining',
];

const lines = [
  '; Generated from the llhttp 9.4.3 Markdown corpus.',
  '; DO NOT EDIT. Run scripts/llhttp/regenerate.sh.',
  '(module llhttp-corpus-generated-test)',
  '(import "llhttp-differential-test" :as differential)',
  '(import "coil.http.parser" :use [HTTP_REQUEST HTTP_RESPONSE])',
  '',
];
let index = 0;
for (const file of files) {
  const raw = fs.readFileSync(path.join(upstream, 'test', file + '.md'), 'utf8');
  const tests: Test[] = [];
  for (const group of new MDGator().parse(raw)) collect(group, tests);
  for (const test of tests) {
    const blocks = test.values.get('http');
    if (blocks === undefined || blocks.length !== 1) continue;
    const metadata = test.meta.get('http')?.[0] ?? {};
    if (metadata.skip === true || metadata.pause !== undefined || metadata.skipBody === true) continue;
    const parserType = file.startsWith('request/') ? 'HTTP_REQUEST' : 'HTTP_RESPONSE';
    index++;
    lines.push(`(deftest corpus-${index}`);
    lines.push(`  (differential/parity ${coilString(wireInput(blocks[0]))} ${parserType}))`);
    lines.push('');
  }
}

lines.splice(2, 0, `; ${index} request/response cases; each runs 4 chunk schedules.`);
fs.writeFileSync(output, lines.join('\n'));

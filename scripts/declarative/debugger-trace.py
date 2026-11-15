"""Where a program stops in lldb, and what the debugger can say there: a
breakpoint on every function whose name begins with PREFIX, and at each of the
first LIMIT stops the function, file and line, the functions of the backtrace,
and each argument's value (or that it has none). One line per stop, so that
two builds of one program can be compared.

    xcrun python3 scripts/declarative/debugger-trace.py PROGRAM PREFIX [LIMIT]
"""
import os
import subprocess
import sys

sys.path.insert(0, subprocess.check_output(["lldb", "-P"], text=True).strip())
import lldb  # noqa: E402


def describe(frame: lldb.SBFrame) -> str:
    line = frame.GetLineEntry()
    place = f"{os.path.basename(line.GetFileSpec().GetFilename() or '?')}:{line.GetLine()}"
    calls = " < ".join(frame.GetThread().GetFrameAtIndex(i).GetFunctionName() or "?"
                       for i in range(min(8, frame.GetThread().GetNumFrames())))
    args = []
    for value in frame.GetVariables(True, False, False, True):
        text = value.GetValue() if value.GetError().Success() else None
        if text is None and value.GetNumChildren() == 0:
            text = "<none>"
        elif text is None:
            text = "{...}"
        args.append(f"{value.GetName()}={text}")
    return f"{frame.GetFunctionName()} @ {place} | {calls} | {' '.join(args)}"


def main() -> int:
    program, prefix = sys.argv[1], sys.argv[2]
    limit = int(sys.argv[3]) if len(sys.argv) > 3 else 300
    debugger = lldb.SBDebugger.Create()
    debugger.SetAsync(False)
    target = debugger.CreateTarget(program)
    if not target.IsValid():
        print(f"cannot load {program}")
        return 2
    target.BreakpointCreateByRegex("^" + prefix.replace(".", r"\."))
    process = target.LaunchSimple(None, None, os.getcwd())
    stops = 0
    while process.IsValid() and process.GetState() == lldb.eStateStopped and stops < limit:
        thread = process.GetSelectedThread()
        if thread.GetStopReason() != lldb.eStopReasonBreakpoint:
            print(f"stopped for another reason: {thread.GetStopDescription(200)}")
            return 1
        print(describe(thread.GetFrameAtIndex(0)))
        stops += 1
        process.Continue()
    if process.IsValid() and process.GetState() not in (lldb.eStateExited,):
        process.Kill()
    return 0


if __name__ == "__main__":
    sys.exit(main())

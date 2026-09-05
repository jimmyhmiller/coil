use regex::bytes::Regex;
use std::hint::black_box;

fn main() {
    let kind = std::env::args().nth(1).expect("benchmark kind");
    let (pattern, byte) = match kind.as_str() {
        "literal" => ("Sherlock", b'x'),
        "nfa" => ("[A-Za-z]+Z", b'a'),
        _ => panic!("unknown benchmark kind: {kind}"),
    };
    let regex = Regex::new(pattern).unwrap();
    let haystack = vec![byte; 16 * 1024 * 1024];
    let mut matches = 0u64;
    for _ in 0..32 {
        matches += regex.is_match(black_box(&haystack)) as u64;
    }
    println!("{matches}");
}

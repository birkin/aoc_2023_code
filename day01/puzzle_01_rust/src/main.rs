// use std::fs::File;
use std::fs::read_to_string;

fn main() {
    // open file ----------------------------------------------------
    // based on <https://doc.rust-lang.org/stable/rust-by-example/std_misc/file/read_lines.html>

    // let lines: Vec<String> = read_to_string("../puzzle_01_source.txt").unwrap_or_else(|err| {
    //     panic!("could not open file; error, ``{}``", err);
    // }).lines().map(|s| s.to_string()).collect();

    let mut lines = Vec::new();

    // for line in read_to_string("../puzzle_01_source.txt").unwrap().lines() {
    //     result.push(line.to_string())
    // }

    for line in read_to_string("../puzzle_01_source.txt")
        .unwrap_or_else(|err| {
            panic!("could not open file; error, ``{}``", err);
        })
        .lines()
    {
        lines.push(line.to_string())
    }

    // let _opened_file = File::open("../puzzle_01_source.txt").unwrap_or_else(|err| {
    //     panic!("could not open file; error, ``{}``", err);
    // });

    println!("Hello, world!");
}

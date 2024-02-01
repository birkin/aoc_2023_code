use std::fs::File;

fn main() {
    // open file ----------------------------------------------------
    let _opened_file = File::open("../puzzle_01_source.txt").unwrap_or_else(|err| {
        panic!("could not open file; error, ``{}``", err);
    });
    println!("Hello, world!");
}

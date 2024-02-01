use std::fs::read_to_string;

fn main() {
    //-- open file --------------------------------------------------
    // based on <https://doc.rust-lang.org/stable/rust-by-example/std_misc/file/read_lines.html>
    let contents: String = read_to_string("../puzzle_01_source.txt").unwrap_or_else(|err| {
        panic!("could not open file; error, ``{}``", err);
    });
    // let zz: () = contents;
    //-- process lines ----------------------------------------------
    for _line in contents.lines() {
        // println!("{}", line);
        let _foo = "bar";
    }
}

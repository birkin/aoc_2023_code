use std::fs::read_to_string;

fn main() {
    //-- open file --------------------------------------------------
    // based on <https://doc.rust-lang.org/stable/rust-by-example/std_misc/file/read_lines.html>
    let contents: String = read_to_string("../puzzle_01_source.txt").unwrap_or_else(|err| {
        panic!("could not open file; error, ``{}``", err);
    });
    // let zz: () = contents;  // my (working) hack attempt at python's `type(contents)` to inspect the type
    //-- process lines ----------------------------------------------
    let numbers: Vec<i8> = Vec::new();
    for line in contents.lines() {
        // println!("{}", line);
        let _foo = "bar";
        let first_number: i8 = get_first_number(&line);
        let second_number: i8 = get_second_number(&line);
        let new_number: i8 = (first_number * 10) + second_number;
        numbers.push(new_number);
    }
    //-- sum numbers ------------------------------------------------
    let mut sum: i8 = 0;
    for number in numbers {
        sum += number;
    }
    //-- print result -----------------------------------------------
    println!("sum_of_numbers: {}", sum);
}

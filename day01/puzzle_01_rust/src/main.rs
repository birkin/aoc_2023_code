use std::fs::read_to_string;

fn main() {
    //-- open file --------------------------------------------------
    // based on <https://doc.rust-lang.org/stable/rust-by-example/std_misc/file/read_lines.html>
    let contents: String = read_to_string("../puzzle_01_source.txt").unwrap_or_else(|err| {
        panic!("could not open file; error, ``{}``", err);
    });
    // let zz: () = contents;  // my (working) hack attempt at python's `type(contents)` to inspect the type
    //-- process lines ----------------------------------------------
    let mut numbers: Vec<i32> = Vec::new();
    for line in contents.lines() {
        // println!("{}", line);
        let _foo = "bar";
        let first_number: i32 = get_first_number(&line);
        let second_number: i32 = get_second_number(&line);
        let new_number: i32 = (first_number * 10) + second_number;
        numbers.push(new_number);
    }
    // println!("numbers, ``{:?}``", numbers);
    //-- sum numbers ------------------------------------------------
    let mut sum: i32 = 0;
    for number in numbers {
        sum += number;
    }
    //-- print result -----------------------------------------------
    println!("sum_of_numbers: {}", sum);
}

fn get_first_number(line: &str) -> i32 {
    // println!("line for get_first_number(), ``{}``", line);
    let mut first_number: i32 = 0;
    for c in line.chars() {
        // println!("{}", c);
        if c.is_digit(10) {
            // println!("found digit");
            first_number = c.to_digit(10).unwrap() as i32;
            break;
        }
    }
    // println!("first_number, ``{}``", first_number);
    return first_number;
}

fn get_second_number(line: &str) -> i32 {
    // println!("line for get_second_number(), ``{}``", line);
    let inverted_line: String = line.chars().rev().collect();
    // println!("inverted_line, ``{}``", inverted_line);
    let second_number: i32 = get_first_number(&inverted_line);
    return second_number;
}

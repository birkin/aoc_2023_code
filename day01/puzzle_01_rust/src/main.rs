use rayon::prelude::*;
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

    // Use a Mutex to safely access `numbers` across threads
    let numbers_mutex = std::sync::Mutex::new(&mut numbers);

    // for line in contents.lines() {
    //     // println!("{}", line);
    //     let _foo = "bar";
    //     let first_number: i32 = get_first_number(&line);
    //     let second_number: i32 = get_second_number(&line);
    //     let new_number: i32 = (first_number * 10) + second_number;
    //     numbers.push(new_number);
    // }

    let lines: Vec<&str> = contents.lines().collect();

    lines.par_iter().for_each(|&line| {
        let first_number: i32 = get_first_number(line);
        let second_number: i32 = get_second_number(line);
        let new_number: i32 = (first_number * 10) + second_number;

        // Lock the mutex to push to the vector safely
        numbers_mutex.lock().unwrap().push(new_number);
    });

    // println!("numbers, ``{:?}``", numbers);
    //-- sum numbers in parallel ------------------------------------
    let sum: i32 = numbers.par_iter().sum();
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

## Narrative

<https://adventofcode.com/2023/day/1>

## Measurements

_(times below from 5 runs; taking middle-total-time); sorted by fastest to slowest_

| Description | Command | Output | %-CPU | total-seconds |
| -------- | -------- | -------- | -------- | -------- |
| rust binary via `release` | % time ./target/release/puzzle_01_rust | sum_of_numbers: 56506 | 33% cpu | 0.012 total |
| mojo binary | % time ./puzzle_01 | sum_of_numbers: 56506 | 63% cpu | 0.020 total |
| nim binary | % time ./puzzle_01 | sum_of_numbers: 56506 | 88% cpu | 0.034 total
| python | % time python ./puzzle_01.py | sum_of_numbers: 56506 | 64% cpu | 0.049 total |
| mojo via terminal | % time mojo ./puzzle_01.mojo | sum_of_numbers: 56506 | 92% cpu | 0.150 total |
| nim via terminal | % nim r ./puzzle_01.nim | sum_of_numbers: 56506 | 83% cpu | 0.115 total |
| rust via terminal | % time cargo run | sum_of_numbers: 56506 | 27% cpu | 0.171 total |


## Note

Even though I've timed the output -- I'm aiming for readability over speed in my code. For instance, rust often uses method-chaining; I'm tending to store the results of a step to a variable, then pass that on to another function.

---

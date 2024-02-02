## Narrative

<https://adventofcode.com/2023/day/1>

## Measurements

_(times below from 5 runs; taking the middle cpu-% and middle-total-time)_

| Description | Command | Output | %-CPU | total-seconds |
| -------- | -------- | -------- | -------- | -------- |
| python | % time python ./puzzle_01.py | sum_of_numbers: 56506 | 64% cpu | 0.049 total |
| mojo via terminal | % time mojo ./puzzle_01.mojo | sum_of_numbers: 56506 | 92% cpu | 0.150 total |
| mojo compiled | % time ./puzzle_01 | sum_of_numbers: 56506 | 63% cpu | 0.020 total |
| rust via terminal | % time cargo run | sum_of_numbers: 56506 | 27% cpu | 0.171 total |
| rust compiled via `release` | % time ./target/release/puzzle_01_rust | sum_of_numbers: 56506 | 33% cpu | 0.012 total |

So...

- slowest-to-fastest: rust via terminal --> mojo via terminal --> python --> mojo compiled --> rust compiled via `release`
- high-to-low CPU usage: mojo via terminal --> python --> mojo compiled --> rust compiled via `release` --> rust via terminal

## Note

Even though I've timed the output -- I'm aiming for readability over speed in my code. For instance, rust often uses method-chaining; I'm tending to store the results of a step to a variable, then pass that on to another function.

---

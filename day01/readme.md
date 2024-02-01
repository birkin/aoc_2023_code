Narrative:
<https://adventofcode.com/2023/day/1>

_(times below from 3 runs; taking the middle cpu-% and middle-total-time)_

python
``` zsh
% time python ./puzzle_01.py
sum_of_numbers: 56506
python ./puzzle_01.py ... 64% cpu 0.049 total
%
```
mojo via terminal
``` zsh
% time mojo ./puzzle_01.mojo
sum_of_numbers: 56506
mojo ./puzzle_01.mojo ... 92% cpu 0.150 total
%
```

mojo compiled-binary
```zsh
% time ./puzzle_01
sum_of_numbers: 56506
./puzzle_01 ... 63% cpu 0.020 total
% 
```

---
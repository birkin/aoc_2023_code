#[ 
    Usage reminder to self...
    - to just run this file: % nim r ./puzzle_01.nim
    - to compile to a binary: % nim c ./puzzle_01.nim
]# 

import strformat
import strutils


## helper functions -------------------------------------------------

proc get_first_number( txt: string ): int =
    #[  Iterates through the characters to get the first number. 
        Called by readLinesFromFile(). 
        Note to self: the odd, seemingly dangling `=` is nim's way of specifing the beginning of a code block, 
                      like an initial `{` in other languages.  ]#
    # echo fmt"txt, ``{txt}``"
    var num: int = 0
    for character in txt:
        # echo fmt"character, ``{character}``"
        if character.isDigit():
            # echo fmt"character is digit"
            # echo "typeof( character ), ", typeof( character )
            # num = int( character )  # doesn't work, returns an integer for the ASCII value
            num = parseInt( $character )  # Use `parseInt` to convert a string to an int
            # echo fmt"num, ``{num}``"
            break
    return num

proc get_second_number( txt: string ): int =
    #[  Reverses the string and calls get_first_number(). 
        Called by `readLinesFromFile()`. ]#
    # echo fmt"txt initially, ``{txt}``"
    var invertedTxt = newSeq[char](txt.len)
    for i in 0..<txt.len:
        invertedTxt[i] = txt[txt.len - i - 1]
    let invertedTxtStr = join(invertedTxt, "")  # Join characters without a delimiter
    # echo fmt"invertedTxtStr, ``{invertedTxtStr}``"
    let num = get_first_number(invertedTxtStr)  # Assuming get_first_number is defined elsewhere
    return num

proc readLinesFromFile(filename: string): seq[int] =
    #[  Reads the file and processes the lines. 
        Called by the main code block. ]#
    ## set up numbers array -------------------------------
    var numbers: seq[int] = @[]  # the equivalent of `numbers = []` in python
    ## open the file --------------------------------------
    let file = open(filename, fmRead)
    defer: file.close()  # ensures file is closed when the proc exits
    ## process lines --------------------------------------
    for line in file.lines:
        ## get the numbers --------------------------------
        let first_number: int = get_first_number(line)
        # echo fmt"Line {index}, first_number: `{first_number}`"
        let second_number: int = get_second_number(line)
        # echo fmt"Line {index}, second_number: `{second_number}`"
        # let num: int = parseInt( $first_number & $second_number )
        let num: int = (first_number * 10) + second_number
        # echo fmt"Line {index}, num: `{num}`"
        ## add num to holder array ------------------------
        numbers.add(num)
    return numbers

## end helper functions ---------------------------------------------


## main code block --------------------------------------------------

## open and get sequence of numbers -----------------------
let filename = "./puzzle_01_source.txt"
let numbers_sequence: seq[int] = readLinesFromFile(filename)
# echo fmt"numbers_sequence: `{numbers_sequence}`"
# echo "typeof( numbers_sequence ), ", typeof( numbers_sequence )  # yields: typeof( numbers_sequence ), seq[int]
## add up all the numbers ---------------------------------
# let sum_of_numbers: int = numbers_sequence.sum()  # didn't work
# let sum_of_numbers: int = sequtils.sum(numbers_sequence) didn't work
var sum_of_numbers: int = 0
for number in numbers_sequence:
    sum_of_numbers += number
## final output -------------------------------------------
echo fmt"sum_of_numbers: `{sum_of_numbers}`"

## end main code block ----------------------------------------------


## experimentation --------------------------------------------------

# import sequtils

# ## create a sequence of numbers
# let some_nums = @[1, 2, 3, 4, 5]

# ## use foldl from sequtils to sum the elements
# let sum = some_nums.foldl(a + b, 0)

# echo "Sum of elements: ", sum

## end experimentation ----------------------------------------------

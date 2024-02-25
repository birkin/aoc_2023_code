#[ 
    Usage reminder to self...
    - to just run this file: % nim r ./01_puzzle.nim
    - to compile: % nim c ./01_puzzle.nim
]# 

import strutils
import streams
import strformat


proc get_first_number( txt: string ): int =
    var num: int = 0
    for character in txt:
        if character.isDigit():
            num = int( character )
            break
    return num


proc readLinesFromFile(filename: string): seq[string] =
    ## open the file ------------------------------------------------
    var lines: seq[string] = @[]
    let file = open(filename, fmRead)
    defer: file.close()  # ensures file is closed when the proc exits
    ## process lines ------------------------------------------------
    for line in file.lines:
        lines.add(line)
        var first_number: int = get_first_number( line )
        echo fmt"first_number, ``{first_number}``"
    return lines


## main code block --------------------------------------------------
let filename = "./puzzle_01_source.txt"
let lines = readLinesFromFile(filename)

# Print lines
for line in lines:
    discard
    # echo fmt"the line is `{line}`"




# def work():
#     """ Manager; called by dunder-main. """
#     lines = []

#     with open( './puzzle_01_source.txt' ) as f:
#         lines = f.readlines()

#     numbers = []
#     for line in lines:
#         first_number = get_first_number( line )
#         second_number = get_second_number( line )
#         num = int( f'{first_number}{second_number}' )
#         numbers.append( num )
#     # print( f'numbers: {numbers}' )

#     sum_of_numbers = sum( numbers )
#     print( f'sum_of_numbers: {sum_of_numbers}' )
#     return


# def get_first_number( txt: str ) -> int:
#     num: int = 0
#     for character in txt:
#         if character.isdigit():
#             num = int( character )
#             break
#     return num


# def get_second_number( txt: str ) -> int:
#     """
#     Wow -- didn't know about this slicing approach. From research...
#     "The general form of slicing is [start:stop:step]."
#     So...
#     >>>
#     >>> s = 'abcdefg'
#     >>> 
#     >>> s[::]
#     'abcdefg'
#     >>> 
#     >>> s[::2]
#     'aceg'
#     >>> 
#     >>> s[::3]
#     'adg'
#     >>> 
#     >>> s[::-1]
#     'gfedcba'
#     >>>     
#     """
#     inverted_txt = txt[::-1]  
#     num: int = get_first_number( inverted_txt )
#     return num


# if __name__ == '__main__':  # just to organize code
#     work()
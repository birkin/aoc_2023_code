#[ 
    Usage reminder to self...
    - to just run this file: % nim r ./01_puzzle.nim
    - to compile: % nim c ./01_puzzle.nim
]# 

import strutils
import streams
import strformat
import sequtils


proc get_first_number( txt: string ): int =
    #[  Iterates through the characters to get the first number. 
        Called by readLinesFromFile(). ]#
    echo fmt"txt, ``{txt}``"
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
    echo fmt"txt initially, ``{txt}``"
    var invertedTxt = newSeq[char](txt.len)
    for i in 0..<txt.len:
        invertedTxt[i] = txt[txt.len - i - 1]
    let invertedTxtStr = join(invertedTxt, "")  # Join characters without a delimiter
    echo fmt"invertedTxtStr, ``{invertedTxtStr}``"
    let num = get_first_number(invertedTxtStr)  # Assuming get_first_number is defined elsewhere
    return num


# proc get_second_number( txt: string ): int =
#     #[  Reverses the string and calls get_first_number(). 
#         Called by `readLinesFromFile()`. ]#
#   var invertedTxt = newSeq[char](txt.len)  # Use `var` to ensure mutability
#   for i in 0..<txt.len:
#     invertedTxt[i] = txt[txt.len - i - 1]
#   let invertedTxtStr = string(invertedTxt)  # Direct conversion to string
#   let num = get_first_number(invertedTxtStr)  # Assuming get_first_number is defined elsewhere
#   return num


proc readLinesFromFile(filename: string): seq[string] =
    ## open the file ------------------------------------------------
    var lines: seq[string] = @[]
    let file = open(filename, fmRead)
    defer: file.close()  # ensures file is closed when the proc exits
    ## process lines ------------------------------------------------
    var index = 0  # Initialize the index
    for line in file.lines:
        # Use the index as needed, similar to the i in Python's enumerate
        var first_number: int = get_first_number(line)
        echo fmt"Line {index}, first_number: `{first_number}`"
        
        var second_number: int = get_second_number(line)
        echo fmt"Line {index}, second_number: `{second_number}`"

        index += 1  # Manually increment the index
        if index > 5:
            break

    return lines

# proc readLinesFromFile(filename: string): seq[string] =
#     ## open the file ------------------------------------------------
#     var lines: seq[string] = @[]
#     let file = open(filename, fmRead)
#     defer: file.close()  # ensures file is closed when the proc exits
#     ## process lines ------------------------------------------------
#     for line in file.lines:
#         # lines.add(line)
#         var first_number: int = get_first_number( line )
#         echo fmt"first_number, ``{first_number}``"
#         var second_number: int = get_second_number( line )
#         echo fmt"second_number, ``{second_number}``"
#     return lines


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
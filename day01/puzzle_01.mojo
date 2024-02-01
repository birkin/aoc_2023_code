fn get_first_number( txt: String ) -> Int:
    """ Returns back first integer found in string. 
        Called by main()."""
    var num: Int = 0
    ## iterate through the characters in the string
    let txt_length: Int = len( txt )
    for i in range( txt_length ):
        let character: String = txt[i]
        # print( 'character: ', character )
        let ord_char = ord( character )
        # print( 'ord_char: ', ord_char )
        if isdigit( ord_char ):
            print( 'found a digit' )
            # num = int( character )
            try:
                num = atol( character )
            except Exception:
                print( 'Error converting string to integer' )
            break
    print( 'returning num: ', num )
    return num


fn get_second_number( txt: String ) -> Int:
    """ Returns back second integer found in string, by inverting the string and calling get_first_number().
        Called by main()."""
    print( 'starting get_second_number()' )
    print( 'starting txt: ', txt )
    var inverted_txt: String = txt[::-1]  
    print( 'inverted_txt: ', inverted_txt )
    let num: Int = get_first_number( inverted_txt )
    return num


fn main():

    ## setup vars ---------------------------------------------------
    var numbers = DynamicVector[Int] ()
    var lines = DynamicVector[String] ()

    ## load source-text ---------------------------------------------
    try:
        with open( './puzzle_01_source.txt', 'r' ) as f:        
            let content: String = f.read()
            lines = content.split("\n")
    except Exception:
        print( 'Error loading source-text' )

    let line_count: Int = len( lines )
    for i in range( line_count ):
        let line: String = lines[i]
        let stripped_line: String = line.strip()
        let first_number: Int = get_first_number( stripped_line )
        print( 'got first_number' )
        let second_number: Int = get_second_number( stripped_line )
        print( 'got second_number' )

        ## join the two integers into a new number ------------------
        # """ This conversion to a string, and back to an int, is silly. 
        #     I guess because I know there are two numbers, I could build the new number directly,
        #     by multiplying the first number by 10, and adding the second number. """
        # let num_str: String = str(first_number) + str(second_number)
        # var num = 0
        # try:
        #     num = atol( num_str )  # to parse a string containing base-10 (decimal) digits and convert it into a long integer
        # except Exception:
        #     print( 'Error converting string to integer' )
        let num: Int = first_number * 10 + second_number  # sanity prevails!

        ## update the numbers list ----------------------------------
        numbers.append( num )

    # print( f'numbers: {pprint.pformat(numbers)}' )
    # print( f'numbers: {numbers}' )

    let numbers_size: Int = len( numbers )
    var sum_of_nums: Int = 0
    for i in range( numbers_size ):
        sum_of_nums += numbers.__getitem__(i)

    print( 'sum_of_numbers: ' + str(sum_of_nums) )

# Diamond
#
# PROBLEM
# Write a Diamond class with a class method that takes a letter as argument
# and outputs a diamond (horizontally symmetrical, vertically symmetrical, 
# width equaling height) with argument letter at the horizontal vertices and
# letters in ascending order from top to midline and in descending order from
# midline to bottom vertex.  
#
# EXAMPLES
# Diamond.make_diamond("A")  # output:  A
#
# Diamond.make_diamond("C")  # output:  A
#                                      B B
#                                     C   C
#                                      B B
#                                       A
#                               
# DATA STRUCTURE
# Array -> String
#
# AlGORITHM
# - make empty array to hold rows
# - make array of letters from A to letter argument, and back down to A
# - determine row width
# - create rows and append to rows array
#   - (row_width-1)/2 spaces + 'A' + (row_width-1)/2
#   - (row_width - 3)/2 spaces + 'B B' + (row_width - 3)/2 spaces  (1 space between 'B's)
#   - (row_width - 5)/2 spaces = 'C   C' + (row_width - 5)/2    (3 spaces between 'C's)
#   ...
# - iterate over rows in rows array to create result_string

class Diamond
  def self.make_diamond(letter)
    rows = []
    width = row_width(letter)
    letters_array = create_letters_array(letter)
    
    letters_array.each do |letter|
      rows << make_row(letter, width)
    end  
    
    output_str = convert_rows_to_string(rows)
    puts output_str
    output_str
  end

  private

  def self.create_letters_array(letter)
    letters = []
    ('A'...letter).each { |letter| letters << letter }
    ('A'..letter).reverse_each { |letter| letters << letter }
    letters
  end

  def self.row_width(letter)
    2*(letter.ord - "A".ord) + 1
  end

  def self.make_outer_spaces(width, inner_str_size)
    num_spaces = (width - inner_str_size)/2
    " " * num_spaces
  end

  def self.make_inner_string(letter)
    case letter
    when "A"
      "A"
    else
      "#{letter}#{make_inner_spaces(letter)}#{letter}"
    end
  end

  def self.make_inner_spaces(letter)
    num_spaces = (2*(letter.ord - "A".ord)) - 1
    " " * num_spaces
  end

  def self.make_row(letter, width)
    row_str = ""                                                 
    inner_str = make_inner_string(letter)
    outer_spaces = make_outer_spaces(width, inner_str.size)
    row_str << "#{outer_spaces}#{inner_str}#{outer_spaces}\n"
    row_str
  end

  def self.convert_rows_to_string(rows_array)
    output_str = ""
    rows_array.each do |row|
      output_str << row
    end
    output_str
  end
end

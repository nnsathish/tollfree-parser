require 'tollfree_parser/keyboard_layout'
require 'tollfree_parser/dictionary'

module TollfreeParser
  class Base
    attr_accessor :keyboard_layout, :dictionary

    def initialize(kb_layout = nil, dict = nil)
      @keyboard_layout = kb_layout || KeyboardLayout.new
      @dictionary = dict || Dictionary.new
    end

    def parse(number)
      numbers = number.to_s.chars

      strings = get_all_strings(numbers)
      find_matching_words(strings)
    end

    private

    # recursively find all possible string combinations for a number
    def get_all_strings(numbers, prefix = '', strings = [])
      if numbers.empty?
        strings << prefix
        return
      end

      number = numbers.first.to_i
      letters = self.keyboard_layout.get_letters(number)
      letters.each { |l| get_all_strings(numbers[1..-1], prefix + l, strings) }

      strings
    end

    def find_matching_words(strings)
      words = []

      strings.each do |str|
        dict_words = dictionary.words

        if dict_words[str.upcase] # full match
          words << str.upcase
        else
          part_words = find_partial_words(str)
          next if part_words.empty? # no match

          if part_words.join == str # set of words without number
            words << str.upcase
          else # set of words with number
            number_index = part_words.join.length
            next if number_index == str.length - 1 # if last digit is a number

            substr = str.slice(number_index+1..-1)
            other_part_words = find_partial_words(substr)
            next unless other_part_words.join == substr # invalid string after the number
            
            number_char = str.slice(number_index, 1)
            number = keyboard_layout.find_number(number_char)
            str[number_index] = number.to_s
            words << str.upcase
          end
        end
      end

      words.uniq
    end

    def find_partial_words(str)
      part_words = []
      substr_start_index = 0
      dict_words = dictionary.words

      str.length.times do |i|
        substr = str.slice(substr_start_index..i)
        next unless dict_words[substr.upcase]    
        part_words << substr
        substr_start_index = i + 1
      end

      part_words
    end
  end
end

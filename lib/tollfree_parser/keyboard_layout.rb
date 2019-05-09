module TollfreeParser
  class KeyboardLayout
    attr_accessor :map

    DEFAULT_MAP = {
      1 => nil,
      2 => 'a,b,c',
      3 => %w(d e f),
      4 => %w(g h i),
      5 => 'j,k,l',
      6 => 'm,n,o',
    }

    def initialize
      @map = {}
    end

    def add(number, letters = nil)
      letters = letters.to_s.split(',') if letters.is_a?(String)
      self.map[number] = letters
    end

    def get_letters(number)
      self.map[number] || [number.to_s]
    end

    def find_number(char)
      return char.to_i if char.match?(/[0-9]+/)

      arr = self.map.detect do |no, chars|
        next unless chars
        chars.include?(char)
      end
      arr && arr.first
    end

    def load_defaults!
      DEFAULT_MAP.each do |no, letters|
        self.add(no, letters)
      end
      self
    end
  end
end

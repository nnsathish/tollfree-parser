require 'json'

module TollfreeParser
  class Dictionary
    attr_accessor :words

    DATA_FILE_PATH = 'data/dictionary.json'

    def initialize
      @words = {} # hash lookups are faster than array
    end

    def add(word)
      return if word.to_s.empty?
      self.words[word] = 1
    end

    def load_defaults!
      defaults = JSON.parse(File.read(DATA_FILE_PATH))
      defaults.each { |word| self.add(word) }
      self
    end
  end
end

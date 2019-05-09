require "tollfree_parser/version"
require 'tollfree_parser/base'

module TollfreeParser

  class << self
    # Simple wrapper to run with default input values for
    # keyboard layout and the dictionary
    def run(number)
      base = setup_base
      words = base.parse(number)
    end

    private

    def setup_base
      kb_layout = setup_kb_layout
      dict = setup_dictionary
      base = Base.new(kb_layout, dict)
    end

    def setup_kb_layout
      kb_layout = KeyboardLayout.new
      kb_layout.load_defaults!
    end

    def setup_dictionary
      dict = Dictionary.new
      dict.load_defaults!
    end
  end
end

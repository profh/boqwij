module Boqwij
  # A set of extensions to the String class.
  module StringExtensions
    # A method to capitalize the first letter of each word in a string.
    def capwords
      @words = self.split
      @revised = %w[]
      @words.each do |word|
        @revised << word.capitalize
      end
      @final = @revised.join(" ")  
    end

    # A method to wrap parenthese around a given string.
    def parens
      '(' + self.to_s() + ')'
    end

    # A method to detect whether a given string is a palidrome. 
    # (e.g., 'civic'.is_palindrome? # => true)
    def is_palindrome?
      @original = self
      @backwards = @original.reverse
      return false if @original.casecmp(@backwards) != 0
      true
    end
  end
end

# Add methods to the String class
String.send :include, Boqwij::StringExtensions
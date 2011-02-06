module Boqwij
  # A set of extensions to the Integer class.
  module IntegerExtensions
    # Test if integer is odd.
    def odd?
      self%2 != 0
    end
    
    # Test if integer is even.
    def even?
      !self.odd?
    end
    
    # Test if integer is negative.
    def neg?
      self < 0
    end
    
    # Test if integer is positive.
    def pos?
      self > 0
    end
    
    # Find the length of an integer.
    def length
      n, count = self, 1
      while n > 9
        n /= 10
        count += 1
      end
      count
    end
    
    # Add a delimiter to every three digits of a long integer.  The default delimiter is a comma.
    def delimit(delimiter = ",")
  		self.to_s.gsub(/(\d)(?=(\d\d\d)+(?!\d))/, "\\1#{delimiter}")
  	rescue
  		self.to_s
  	end
    
    # Get the factorial of given number.
    # (e.g., 6.factorial # => 720)
    def factorial
      return nil if self < 1
      n = self
      count = n
      fact = 1
      count.times do
        fact = fact * n
        n -= 1
      end
      fact
    end
    
    # Get the fibonacci number associated with a particular integer. 
    # (e.g., 6.fibonacci # => 8; 10.fibonacci # => 55)
    def fibonacci
      return nil if self < 1
      current, successor = 0, 1
    	self.times { |i| current, successor = successor, current + successor}
    	current
    end
    
    # Checks to see if integer is contained in the fibonacci sequence.
    # (e.g, 12.is_fibonacci? # => false; 55.is_fibonacci? # => true)
    def is_fibonacci?
      return true if self == 1
      a, b = Math.sqrt((5*(self**2))+4), Math.sqrt((5*(self**2))-4)
      return true if (a.to_i == a and b.to_i != b) or (a.to_i != a && b.to_i == b)
      return false
    end
    
    # Test to see if a given number is prime. 
    # (e.g., 2.is_prime? # => true; 104743.is_prime? # => true; 
    # e.g., 4.is_prime? # => false; 104742.is_prime? # => false)
    def is_prime?
      if    self == 1     then return false
      elsif self < 4      then return true
      elsif self % 2 == 0 then return false
      elsif self < 9      then return true
      elsif self % 3 == 0 then return false
      else
        5.step(Math.sqrt(self).to_i, 2) do |x|
          return false if self % x == 0
        end
      end
      return true
    end
    
    # Get an array of prime factors for any integer. 
    # (e.g., 30.prime_factors # => [2,3,5])
    def prime_factors
      return [self] if self.is_prime?
      current, to_factor, factors, max = 2, self, [], 0
      while to_factor % current == 0
        factors << current
        to_factor /= current
      end
      current += 1
      max = Math.sqrt(to_factor).to_i + 1
      while to_factor >= max
        if to_factor % current == 0
          factors << current
          to_factor /= current
        else
          current += 2
        end
      end
      factors << to_factor if to_factor > 1
      factors
    end
    
    # Test if a number is divisible by a given factor. 
    # (e.g., 18.is_divisible_by?(3) #=> true)
    def is_divisible_by?(factor)
      self%factor == 0
    end
    
    # Test to see if a given number is a palindrome.
    # (e.g., 1001.is_palindrome? # => true; 4654.is_palindrome? # => false)
    def is_palindrome?
      return false if self < 0
      @original = self.to_s
      @backwards = @original.reverse
      @original.to_i == @backwards.to_i
    end
    
    # Compares two integers to see if they are permutations of each other. 
    # (e.g, 314159.is_permutation_of?(431951) # => true)
    def is_permutation_of?(x)
      return true if self == x
      primes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]
      s, s_total, x_total = self, 1, 1
      while s > 0
        s_total *= primes[s % 10]
        s /= 10
      end
      while x > 0
        x_total *= primes[x % 10]
        x /= 10
      end
      s_total == x_total
    end
  end
end

# Add methods to the Integer class
Integer.send :include, Boqwij::IntegerExtensions
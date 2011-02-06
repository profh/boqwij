module Boqwij
  # A set of extensions to the Array class
  module ArrayExtensions
    # Get the sum of an all-numeric array. 
    # Raises a runtime error if non-numeric array is used.
    def sum
      begin
        raise RuntimeError if self.empty?
        self.inject do |sum, num| 
          raise RuntimeError unless num.kind_of?(Numeric)
          sum + num 
        end
      rescue Exception => e
        "The sum could not be calculated for this array"
      end
    end

    # Get the product of an all-numeric array. 
    # Raises a runtime error if non-numeric array is used.
    def product
      begin
        raise RuntimeError if self.empty?
        self.inject do |product, num| 
          raise RuntimeError unless num.kind_of?(Numeric)
          product * num 
        end
      rescue Exception => e
        "The product could not be calculated for this array"
      end
    end
    
    # Get the mean of an all-numeric array. 
    # Raises a runtime error if non-numeric array is used.
    def mean
      begin
        raise RuntimeError if self.empty?
        self.each do |value|
          raise RuntimeError unless value.kind_of?(Numeric)
        end
        self.sum.to_f / self.length
      rescue Exception => e
        "The mean could not be calculated for this array"
      end
    end

    # Get the median of an all-numeric array. 
    # Raises a runtime error if non-numeric array is used.
    def median
      begin
        raise RuntimeError if self.empty?
        (self.sort!.size.odd?) ? self[(self.size/2)] : (self[(self.size/2)] + self[((self.size-1)/2)])/2.0
      rescue Exception => e
        "The median could not be calculated for this array"
      end  
    end

    # Get the range of values in an all-numeric array. 
    # Raises a runtime error if non-numeric array is used.
    def range 
      begin
        raise RuntimeError if self.empty?
        (self.max - self.min)
      rescue Exception => e
        "The range could not be calculated for this array"
      end
    end

    # Get the standard deviation of an all-numeric array. 
    # Raises a runtime error if non-numeric array is used.
    def stdev
      begin
        raise RuntimeError if self.empty?
        # self.each {|i| raise RuntimeError if unless i.kind_of?(Numeric)}
        mean = self.mean
        n = self.length
        if n.zero?
          return nil
        else
          sq_dist = self.inject(0) { |sum, num| sum += (num - mean)**2 } 
          stdev = Math.sqrt(sq_dist/(n-1))
        end
      rescue Exception => e
        "The stddev could not be calculated for this array"
      end
    end

    # Randomize the order of an array.
    def randomize
      self.sort_by { rand }
    end

    # Randomize the order of an array and make the change permanent.
    def randomize!
      self.replace(self.randomize)
    end

    # Get the first value of a randomized array.
    def random
      self.randomize.first
    end
  end
end

# Add methods to the Array class
Array.send :include, Boqwij::ArrayExtensions
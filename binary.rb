require 'pry'
# Problem
#-------------------
# Given a base-10 integer, n, convert it to binary (base-2). 
# Then find and print the base-10 integer denoting the 
# maximum number of consecutive 1's in n's binary representation.

def consecutive_ones(num)
  tally = []
  count = 0
  digits = num.to_s.chars.map(&:to_i)
  digits.each do |digit|
    if digit == 0
      tally << count
      count = 0
    else
      count += 1
    end
  end
  tally << count unless count == 0
  tally
end

def base10_to_base2(base_10_num)
end

base10_to_base2(8)  # => 100
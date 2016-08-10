require 'pry'
# Problem
#-------------------
# Given a base-10 integer, n, convert it to binary (base-2). 
# Then find and print the base-10 integer denoting the 
# maximum number of consecutive 1's in n's binary representation.

def consecutive_ones(digits)
  tally = []
  count = 0
  # digits = num.to_s.chars.map(&:to_i)
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

def highest_power_of_2(num)
  power = Math.sqrt(num).floor
  half = num
  loop do
    return power if num == 2**power
    if 2**power > num
      half /= 2
      power = Math.sqrt(half).floor
    else
      if 2**(power+1) > num
        return power
      else
        power += 1
      end
    end
  end
end

def base10_to_base2(base_10_num)
  power = highest_power_of_2(base_10_num)
  bin_arr = Array.new(power+1)
  bin_arr.fill(0)
  bin_arr[power] = 1
  left_over = base_10_num - 2**power

  loop do
    break if left_over == 0
    power = highest_power_of_2(left_over)
    bin_arr[power] = 1
    left_over -= 2**power
  end

  bin_arr.reverse
end

puts consecutive_ones(base10_to_base2(5)).max
puts consecutive_ones(base10_to_base2(13)).max
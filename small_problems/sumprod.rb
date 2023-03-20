def is_integer?(num)
  num.to_i.to_s == num
end

number = ''
loop do
  puts ">> Please enter an integer greater than 0:"
  number = gets.chomp
  if is_integer?(number)
    number = number.to_i 
    break
  else
    puts "that is not a valid integer."
  end
end

s_or_p = ''
loop do
  puts ">> Enter 's' to compute the sum, 'p' to compute the product."
  s_or_p = gets.chomp
  if s_or_p == "s"
    break
  elsif s_or_p == "p"
    break
  else
    puts "that is not a valid selection"
  end
end

# result = []
# 1.upto(number) { |i| result << i }
# total = 1
# if s_or_p == "s"
#  total = result.sum
# end

# if s_or_p == "p"
#   until result.empty?
#   total *= result.shift
#   end
# end

# p total

if s_or_p == "s"
  total = (1..number).reduce(:+)
elsif s_or_p == "p"
  total = (1..number).reduce(:*)
end

p total
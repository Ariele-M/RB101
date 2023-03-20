def is_integer?(num)
  num.to_i.to_s == num
end

numbers = []
loop do
  puts "==> Enter the first number:"
  num = gets.chomp
  if is_integer?(num)
    numbers << num.to_i
    break
  end
  puts "Please enter a valid integer."
end

loop do
  puts "==> Enter the second number:"
  num = gets.chomp
  if is_integer?(num)
    numbers << num.to_i
    break
  end
  puts "Please enter a valid integer."
end

puts "==> #{numbers[0]} + #{numbers[1]} = #{numbers.sum}"
puts "==> #{numbers[0]} - #{numbers[1]} = #{numbers.inject(:-)}"
puts "==> #{numbers[0]} * #{numbers[1]} = #{numbers.reduce(:*)}"
puts "==> #{numbers[0]} / #{numbers[1]} = #{numbers.inject(:/)}"
puts "==> #{numbers[0]} % #{numbers[1]} = #{numbers.inject(:%)}"
puts "==> #{numbers[0]} ** #{numbers[1]} = #{numbers.inject(:**)}"
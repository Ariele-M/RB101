NUMBER_ST = {
  1 => "1st",
  2 => "2nd",
  3 => "3rd",
  4 => "4th",
  5 => "5th",
  6 => "6th"
}

def get_number(num)
  answer = ''
  loop do
    puts "==> Enter the #{NUMBER_ST[num]} number:"
    answer = gets.chomp
    break if answer.to_i.to_s == answer
    puts "that is not a number"
  end
  answer.to_i
end

array = []
count = 1
until count > 5
  array << get_number(count)
  count += 1
end

comparison_number = get_number(6)

puts array.include?(comparison_number) ? "The number #{comparison_number} appears in #{array.to_s}." : "The number #{comparison_number} does not appear in #{array.to_s}."

puts "Please write word or multiple words:"
answer = gets.chomp

array = answer.split
count = array.map do |word|
  word.size
end
char_count = count.sum

puts "There are #{char_count} characters in '#{answer}'."
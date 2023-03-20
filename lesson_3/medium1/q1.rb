=begin
def add_spaces(string)
  number = 1
  puts string
  until number == 10
    puts string.insert(0, ' ')
    number += 1
  end
end

string = "The Flintstones Rock!"

add_spaces(string)
=end
# one line program....

# 10.times { |number| puts (number * ' ') + "The Flintstones Rock!"}

10.times { |number| puts (" " * number) + "The Flintstones Rock!" }
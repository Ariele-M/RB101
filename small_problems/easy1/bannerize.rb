def print_in_box(str)
  x = str.size
  puts "+-" + ("-" * x) + "-+"
  puts "| " + (" " * x ) + " |"
  puts "| " + str + " |"
  puts "| " + (" " * x) + " |"
  puts "+-" + ("-" * x) + ("-+")
end

print_in_box('To boldly go where no one has gone before.')

print_in_box('')
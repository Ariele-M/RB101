def print_in_box(str)
  x = str.size
  horizontal_line = "+-" + ("-" * x) + "-+"
  empty_line = "| " + (" " * x) + " |"
  lines = x/76.0.round

  puts horizontal_line
  puts empty_line
  
  puts "| " + str + " |"
  puts empty_line
  puts horizontal_line
end

print_in_box('To boldly go where no one has gone before.')

print_in_box('')
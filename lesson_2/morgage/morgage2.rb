# Print greeting
# while
  # initialize variables
  # while
    # get loan amount from user. set value to variable
    # if valid format - break
    # else PRINT error message
  # while  
    # get term from user set value to variable
    # if valid format - break
    # else PRINT error message
  # while
    # get apr from user set value to variable
    # if valid format - break
    # else PRINT error message

    # apr to monthly interest
  # READ variables and run calculation
  # PRINT Calculation results message
  # PRINT request to repeat calculation
# END

def valid_amount?(num)
  /^\$?\d*((\.\d\d)|\b)$/.match(num) && /\d/.match(num)
end

puts "Welcome to the Calculator!"

loop do
  puts "Please enter the loan amount:"
  amount = gets.chomp
  break if valid_amount?(amount)
  puts "That is not a valid dollar amount."
end


# puts "Please enter the term years:"
# years = gets.chomp

# puts "Please enter the term months:"
# months = gets.chomp

# puts "Please enter the apr:"
# apr = gets.chomp


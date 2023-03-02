# a method that returns the sum of two integers

# START

# SET a method sum_integers that takes two integer parameters a and b
# IF a & b are integers
# READ a and b then sum them
# ELSE
# PRINT "these are not integers"

# END


def sum_method(a, b)
  if (a.is_a?(Integer) && b.is_a?(Integer))
    p a + b    
  else 
    puts "both arguments must be integers"
  end
end

sum_method(1, 6)
sum_method(1.2, 4)
sum_method("a", 6)




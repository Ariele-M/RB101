def multiply(a, b)
  a * b
end

# def square(n)
#   multiply(n, n)
# end

def to_the_power(n, exp)
  multiply(n, n**(exp-1))
end

p to_the_power(5, 2) == 25
p to_the_power(-8, 3) == -512
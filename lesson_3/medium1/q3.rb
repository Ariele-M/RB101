def factors(number)
  divisor = number
  factors = []
  while divisor > 0
    factors << (number / divisor) if number % divisor == 0
    divisor -= 1
  end
  factors
end

p factors(15)
p factors(25)
p factors(-15)
p factors(0)

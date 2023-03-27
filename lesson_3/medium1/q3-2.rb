def factors(number)
  divisor = number.abs
  factors = []
  while divisor > 0
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end

p factors(6)
p factors(-16)
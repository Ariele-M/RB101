def factors(number)
  divisor = number.abs
  (1..number).select { |n| number / divisor if number % divisor == 0 }
end

p factors(6)
p factors(-16)
=begin
def stringy(number)
  string = ''
  until string.size = number
    string = '1'
    string += '0'
  end
end
=end

def stringy(number)
  string = ''
  if number.even?
    string = "10" * (number / 2)
  elsif number == 1
    string = "1"
  else
    string = ("10" * ((number -  2) / 2)) + "1"
  end
end



puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
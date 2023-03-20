def center_of(string)
  size = string.size
if size.odd?  
  x = string[(size / 2)]
else 
  x = string[(size - 1) / 2] + string[(size + 1) / 2]
end 
end


p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'
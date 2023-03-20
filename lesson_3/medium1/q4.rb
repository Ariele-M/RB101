def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  if dot_separated_words.size == 4
    while dot_separated_words.size > 0 do
      word = dot_separated_words.pop
      break unless is_an_ip_number?(word)
    end
    return true
  else
    return false
  end
end

# not returning a false condition
# not handling case when there are more or fewer than 4 components to IP address

dot_separated_ip_address?(123)
dot_separated_ip_address?('123')
dot_separated_ip_address?('123.23.234.23')
dot_separated_ip_address?('asd.ds.erd')
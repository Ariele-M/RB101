def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  if dot_separate_words.size != 4
    false
    break
  end
  ip_words = dot_separated_words.select do |word|
    is_an_ip_number?(word)
  end
  ip_words.empty? ? false : true
end


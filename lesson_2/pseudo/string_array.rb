=begin
a method that takes an array of strings, and returns a string that is all those 
strings concatenated together

Given an array of strings
iterates through array
concatenates each element to the prior element(s)
returns new string that is a concatenated version of all elements

START 

given an array of strings called "words"

SET combo[words] 
WHILE array has more words


=end

words = ["hello", "how are you", "43", "GREAT!"]

def combo(words)
   words.join    
end


p combo(words)
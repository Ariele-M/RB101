require "pry"
require 'yaml'
MESSAGES = YAML.load_file('morgage_messages.yml')

def messages(message) # links messages from yaml
  MESSAGES[message]
end

def prompt(key) 
  message = messages(key)
  puts("=> #{message}")
end

def number?(num)
  /\d/.match(num) && /^-?\d*\.?\d*$/.match(num)
end

def positive?(num)
  num.to_i == num.to_i.abs
end

def total_months(years, months) # checks combo, not 0 total
  if months.to_i < 12
    (years.to_i * 12) + months.to_i
  elsif years == '0' && months.match(/[^0]/)
    months.to_i
  else
    puts "that is a strange duration format for a loan."
  end
end

def monthly_payment(p, j, n)
  p * (j / (1 - (1 + j)**(-n)))
end

prompt('welcome')

loop do # dollar format, validate number validation allow for $ sign
  prompt('amount')
  loan_amount = gets.chomp
  if number?(loan_amount)
    break
  else
    "That is not a valid dollar amount."
  end
end

term_years = '0'
loop do
  prompt('years') 
  term_years = gets.chomp
  break if number?(term_years) && positive?(term_years)
  puts "Please only enter positive integers"
end

term_months = '0'
loop do
  prompt('months') 
  term_months = gets.chomp
  break if number?(term_months) && positive?(term_months)
  puts "Please only enter positive integers"
end

total_months(term_years, term_months)

prompt('apr') # determin if entered as rate or %. if = 100 or above,
# error message if rate really high
apr = gets.chomp.to_f

puts "Please confirm your loan details"
confirmation = gets.chomp

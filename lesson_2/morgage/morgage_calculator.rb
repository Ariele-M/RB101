require "pry"
require 'yaml'
MESSAGES = YAML.load_file('morgage_messages.yml')

def messages(message)
  MESSAGES[message]
end

def prompt(key)
  message = messages(key)
  puts("=> #{message}")
end

def number?(num)
  /\d/.match(num) && /^-?\d*\.?\d*$/.match(num)
end


def total_months(years, months)
  if months.match(/[0-9]/) && months.to_i < 12 #negative numbers
    p (years.to_i * 12) + months.to_i
  elsif years == '0' && months.match(/[^0]/)
    p months.to_i
  else
    puts "that is a strange duration format for a loan."
  end
end

def monthly_payment(p, j, n)
  m = p * (j / (1 - (1 + j)**(-n)))
end

prompt('welcome')

loop do
  prompt('amount')
  loan_amount = gets.chomp
  if number?(loan_amount)
    break
  else 
    "That is not a valid dollar amount."
  end
end

prompt('years')
term_years = gets.chomp
prompt('months')
term_months = gets.chomp
term = total_months(term_years, term_months) 


prompt('apr')
apr = gets.chomp.to_f

puts "Please confirm your loan "
p confirmation = gets.chomp 
confirmation


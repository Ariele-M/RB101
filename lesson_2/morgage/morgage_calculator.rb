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

def months(years, months)
  (years * 12) + months
end

def monthly_payment(p, j, n)
  m = p * (j / (1 - (1 + j)**(-n)))
end

prompt('welcome')

loop do
prompt('amount')
loan_amount = gets.chomp.to_i

prompt('years')
term_years = gets.chomp.to_i

prompt('months')
term_months = gets.chomp.to_i

prompt('apr')
apr = gets.chomp.to_f

puts "Please confirm your loan is for $#{loan_amount} for a term of #{term_years} years and #{term_months} months with an APR of #{apr}% (y/n)"
confirmation = gets.chomp 

term = months(term_years, term_months)

monthly_rate =  case apr
                when < 0
                  apr
                when > 0
                  apr/100
                end
p monthly_payment = loan_amount * (monthly_rate/(1 - (1 + monthly_rate)**(-term)))

monthly_payment(loan_amount, monthly_rate, term)



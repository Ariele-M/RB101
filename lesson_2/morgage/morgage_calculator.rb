require 'yaml'
MESSAGES = YAML.load_file('morgage_messages.yml')

def messages(message) # links messages from yaml
  MESSAGES[message]
end

def prompt(key)
  message = messages(key)
  puts("=> #{message}")
end

def float?(num)
  /\d/.match(num) && /^\d*\.?\d*$/.match(num)
end

def integer?(num)
  positive?(num) && num == num.to_i.to_s
end

def positive?(num)
  num.to_i == num.to_i.abs
end

def monthly_payment(p, j, n)
  (p * (j / (1 - (1 + j)**(-n)))).round(2)
end

prompt('welcome')
loan_amount = '0'
loop do # dollar format, validate number validation allow for $ sign
  prompt('amount')
  loan_amount = gets.chomp
  if float?(loan_amount)
    loan_amount = loan_amount.to_f.round(2)
    break
  else
    "That is not a valid dollar amount."
  end
end

term_years = '0'
term_months = '0'
loop do # term
  loop do
    prompt('years')
    term_years = gets.chomp
    break if integer?(term_years)
    puts "Please only enter positive integers"
  end

  loop do
    prompt('months')
    term_months = gets.chomp
    break if integer?(term_months)
    puts "Please only enter positive integers"
  end

  if term_years == '0' && term_months != '0'
    break
  elsif term_years != '0' && term_months.to_i < 12
    break
  else
    puts "that is a strange duration format for a loan."
  end
end

term = (term_years.to_i * 12) + term_months.to_i

puts "The maximum legal rate of interest in Florida is 18%."
apr = '0'
monthly_interest = '0'
loop do
  prompt('apr')
  apr = gets.chomp
  if apr.to_f >= 0 && apr.to_f <= 0.18 && float?(apr)
    monthly_interest = apr.to_f / 12
    apr = apr.to_f * 100
    break
  elsif apr.to_f >= 1 && apr.to_f <= 18 && apr.match(/^-?\d*\.?\d*\%?$/)
    monthly_interest = apr.to_f / 1200
    apr = apr.to_f
    break
  else
    puts "That is not a valid interest rate in the state of Florida."
  end
end

monthly_payment = monthly_paymnet(loan_amount, monthly_interest, term)
puts "Calculating your monthly payment...."
puts "Your monthly payment is $#{monthly_payment}."

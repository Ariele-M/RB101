require 'yaml'
MESSAGES = YAML.load_file('morgage_messages.yml')

def messages(message)
  MESSAGES[message]
end

def prompt(key)
  message = messages(key)
  puts("=> #{message}")
end

def usd?(num)
  /\d/.match(num) && /^\$?\d*\.?(\b|\d\d)$/.match(num)
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

loop do
  prompt('welcome')
  amount = '0'
  loop do
    prompt('amount')
    amount = gets.chomp
    if usd?(amount)
      amount = amount.to_f.round(2)
      break
    else
      prompt('amount_error')
    end
  end

  years = '0'
  months = '0'
  loop do
    loop do
      prompt('years')
      years = gets.chomp
      break if integer?(years)
      prompt('integer_error')
    end

    loop do
      prompt('months')
      months = gets.chomp
      break if integer?(months)
      prompt('integer_error')
    end

    if years == '0' && months != '0'
      break
    elsif years != '0' && months.to_i < 12
      break
    else
      puts "#{years} years and #{months} months is a strange term for a loan."
    end
  end

  term = (years.to_i * 12) + months.to_i

  prompt('usury')
  apr = '0'
  monthly_interest = '0'
  loop do
    prompt('apr')
    apr = gets.chomp
    if apr.to_f >= 0 && apr.to_f <= 0.18 && apr.match(/^-?\d*\.?\d*$/)
      monthly_interest = apr.to_f / 12
      apr = apr.to_f * 100
      break
    elsif apr.to_f > 0.18 && apr.to_f <= 18 && apr.match(/^-?\d*\.?\d*\%?$/)
      monthly_interest = apr.to_f / 1200
      apr = apr.to_f
      break
    else
      prompt('rate_error')
    end
  end

  monthly_payment = monthly_payment(amount, monthly_interest, term)
  prompt('calculating')

  result_message = <<-MSG
    Your monthly payment is $#{monthly_payment} 
    for a loan amount of $#{amount} 
    with a #{apr}% annual interest rate 
    for a term of #{years} years and #{months} months.
  MSG

  puts result_message

  prompt('new_calc')
  answer = gets.chomp.downcase
  if answer == 'q'
    break
  else
    system "clear"
  end
end

prompt('goodbye')

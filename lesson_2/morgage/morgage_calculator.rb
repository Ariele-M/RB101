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
  /\d/.match(num) && /^\$?\d*((\.\d\d)|\b)$/.match(num)
end

def dollar_to_float(num)
  num.sub(/[\$]/, '0').to_f
end

def integer?(num)
  num.to_i == num.to_i.abs && num == num.to_i.to_s
end

def valid_term?(years, months)
  (years == '0' && months != '0') || (years != '0' && months.to_i < 12)
end

def rate_format?(apr)
  apr.to_f > 0 && apr.to_f <= 0.18 && apr.match(/^-?\d*\.?\d*$/)
end

def percent_format?(apr)
  apr.to_f > 0.18 && apr.to_f <= 18 && apr.match(/^-?\d*\.?\d*\%?$/)
end

def prompt_years
  years = ''
  loop do
    prompt('years')
    years = gets.chomp
    break if integer?(years)
    prompt('integer_error')
  end
  years
end

def prompt_months
  months = ''
  loop do
    prompt('months')
    months = gets.chomp
    break if integer?(months)
    prompt('integer_error')
  end
  months
end

def get_years_months
  years = ''
  months = ''
  loop do
    years = prompt_years
    months = prompt_months
    break if valid_term?(years, months)
    puts "#{years} years and #{months} months is a strange term for a loan."
  end
  { years: years, months: months }
end

def prompt_amount
  amount = ' '
  loop do
    prompt('amount')
    amount = gets.chomp
    break if usd?(amount) && dollar_to_float(amount) != 0
    prompt('amount_error')
  end
  dollar_to_float(amount)
end

def calculate_monthly_payment(amount, monthly_rate, term)
  amount * (monthly_rate / (1 - (1 + monthly_rate)**(-term)))
end

def total_months(years, months)
  (years.to_i * 12) + months.to_i
end

def prompt_apr
  apr = ''
  loop do
    prompt('apr')
    apr = gets.chomp
    if rate_format?(apr)
      apr = apr.to_f * 100
      break
    elsif percent_format?(apr)
      apr = apr.to_f
      break
    else
      prompt('rate_error')
    end
  end
  apr
end

loop do
  prompt('welcome')

  amount = prompt_amount

  years_months = get_years_months
  years = years_months[:years]
  months = years_months[:months]
  term = total_months(years, months)

  prompt('usury_warning')
  apr = prompt_apr
  monthly_rate = apr.to_f / 1200

  monthly_payment = calculate_monthly_payment(amount, monthly_rate, term)

  result_message = <<-MSG
    Your monthly payment is $#{format('%.2f', monthly_payment)} 
    for a loan amount of $#{format('%.2f', amount)} 
    with a #{format('%.2f', apr)}% annual interest rate 
    for a term of #{years} years and #{months} months.
  MSG

  puts result_message

  prompt('new_calc')
  answer = gets.chomp.downcase
  break if answer == 'q'
  system "clear"
end

prompt('goodbye')

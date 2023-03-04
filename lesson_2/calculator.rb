# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result

require 'yaml'
MESSAGES = YAML.load_file('calc_config.yml')

LANGUAGE = 'en'

def messages(message, lang='en')
  MESSAGES[lang][message]
end

def prompt(key)
  message = messages(key, LANGUAGE)
  puts("=> #{message}")
end

def prompt2(message)
  puts "=> #{message}"
end

def valid_number?(num)
  num.to_i.to_s == num
end

def number?(num)
  /\d/.match(num) && /^-?\d*\.?\d*$/.match(num)
end

def operation_to_message(operation)
  word =  case operation
          when '1'
            'Adding'
          when '2'
            'Subtracting'
          when '3'
            'Multiplying'
          when '4'
            'Dividing'
          end
  word
end

prompt('welcome')

name = ''
loop do
  name = gets.chomp
  if name.empty? # Add logic for checking for numbers?
    prompt('valid_name')
  elsif number?(name)
    prompt('valid_name')
  else
    break
  end
end

prompt2("Hi #{name}!")

loop do # main loop
  number1 = ""
  loop do
    prompt('first_number')
    number1 = gets.chomp

    if number?(number1)
      break
    else
      prompt('valid_num')
    end
  end

  number2 = ""
  loop do
    prompt('second_number')
    number2 = gets.chomp
    if number?(number2)
      break
    else
      prompt('valid_num')
    end
  end

  prompt('operator_prompt')

  operator = ""
  loop do
    operator = gets.chomp
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt('valid_op')
    end
  end

  prompt2 "#{operation_to_message(operator)} the two numbers..."

  result =  case operator
            when '1'
              number1.to_f + number2.to_f
            when '2'
              number1.to_f - number2.to_f
            when '3'
              number1.to_f * number2.to_f
            when '4'
              number1.to_f / number2.to_f
            end

  prompt2("The result is #{result}")

  prompt('go_again')
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt('goodbye')

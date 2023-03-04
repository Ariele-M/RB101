puts "Please enter the total loan amount in USD:"
loan_amount = gets.chomp.to_i

puts "Please enter the loan term in full years:"
term_years = gets.chomp.to_i

puts "Please enter the loan term in months:"
term_months = gets.chomp.to_i

puts "Please enter the APR on the loan:"
apr = gets.chomp.to_f

puts "Please confirm your loan is for $#{loan_amount} for a term of #{term_years} years and #{term_months} months with an APR of #{apr}% (y/n)"
confirmation = gets.chomp 

term = (term_years * 12) + term_months


monthly_rate = apr/1200

p monthly_payment = loan_amount * (monthly_rate/(1 - (1 + monthly_rate)**(-term)))
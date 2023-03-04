 Needed inputs
  - loan amount in $
  - Annual Percentage Rate (APR)
  - loan duration

Calculate following (output)
  - monthly interest rate
  - loan duration in months
  - monthly payment
  
  M = P(J/(1-(1+J)^-N))
  
  m = p * (j / (1 - (1 + j)**(-n)))

- m = monthly payment
- p = loan amount
- j = monthly interest rate
- n = loan duration in months

-------
Pseudo-Code

Given a loan amount, APR, and loan duration

Calculate the following
  - monthly interest rate
  - load duration in months
  - monthly payment

assign monthly payment value to a variable

-----

START

GET loan amount 
SET variable loan_amount

GET APR
SET variable APR (if > 1 then divide by 100 to get percentage)

GET loan duration in years (confirm no decimals)
GET loan duration in months (confirm integer between 1 and 12, no      decimals)
SET loan_duration 

PRINT Your monthly payment is x

----

Questions
- APR to monthly interest?
- verify rate input as percentage
- ability to do mix of year and month durations
- output message confirming reformatted inputs before running calculation. or with resulting calculation
- show resulting principal vs interest
- round decimal points for dollar amounts
- read with commas? dollar signs?

----

what methods can be extrapolated?
messages to yaml?
error messages for data validation issues
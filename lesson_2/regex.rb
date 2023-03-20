def format_date(string)
  puts string.gsub(/\-/, '\.')
end

format_date('2016-06-17') # -> '17.06.2016'
format_date('2016/06/17') # -> '2016/06/17' (no change)
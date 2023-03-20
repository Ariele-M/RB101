def triangle(n)
  i = 0
  until n - i < 0
    puts ("*" * (n - i))+ (" " * (i))
    i += 1
  end
end

triangle(5)
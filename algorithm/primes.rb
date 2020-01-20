#!/usr/bin/ruby
a = ARGV[0].to_i
i = a - 1
b = 0
while i != 1
  if a % i == 0
    b = 1
  end
  i -= 1
end

if b == 0
  puts "is prime."
else
  puts "not prime."
end

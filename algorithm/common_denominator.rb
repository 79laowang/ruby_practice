#!/usr/bin/ruby
a = ARGV[0].to_i
b = ARGV[1].to_i
c = 0

while a != 0
  c = b
  b = a
  a = c % a
end

puts b

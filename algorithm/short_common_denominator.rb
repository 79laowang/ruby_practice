#!/usr/bin/ruby
a, b = ARGV.map(&:to_i)
a, b = 0, 0 if a == 0 or b == 0
a, b = b, a % b while b != 0
puts a

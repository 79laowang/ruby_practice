#!/usr/bin/ruby -w
# -*- coding : utf-8 -*-

x = 1
if x > 2
  puts "x is greater than 2"
elsif x <= 2 and x != 0
  puts "x is equal to 1"
else
  puts "Unknown x"
end

puts "if modifier usage:"
$debug = 1
print "debug...\n" if $debug

puts "Ruby unless conditional:"
x = 1
puts "x = #{x}"
unless x > 2
  puts "x is less than 2"
else
  puts "x is greater than 2"
end

puts "unless modifier usage:"
$var = 1
print "1 -- this line with output:\n" if $var
print "2 -- this line without output:\n" unless $var

$var = false
print "3 -- this line with output:\n" unless $var


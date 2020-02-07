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

puts "case usage:"
# range === n or range.include?(n)。
$age = 5
case $age
when 0 .. 2
  puts "Baby!"
when 3 .. 6
  puts "Kid!"
when 7 .. 12 
  puts "Child!"
when 13 .. 18
  puts "Teen!"
else 
  puts "Others age!"
end

# When the "expression" part of the case is omitted, the first when condition part is evaluated as a true expression
foo  = false
bar = true
quu = false
case
when foo then puts 'foo is true'
when bar then puts 'bar is true'
when quu then puts 'quu is true'
end

case "Hi there"
when String
  puts "case statements match class"
end

# /regexp/ === "string"
case "FOOBAR"
when /BAR$/
  puts "they can match regular expressions!"
end

# Match validation using procs and lambdas
case 40
when -> (n) { n.to_s == "40" }
  puts "lambdas!"
end

# Create your own matching class and add the === method
class Success
  def self.===(item)
    item.status >= 200 && item.status < 300
  end
end

class Empty
  def self.===(item)
    item.response_size == 0
  end
end

class HttpR 
  attr_accessor :status, :response_size
  def initialize(mystatus,myresponse_size=0)
    @status = mystatus
    if @status >= 200 && @status < 300
      @response_size = 1
    else
      @response_size = myresponse_size
    end
  end
end

http_response = HttpR.new(200)
case http_response
when Empty
  puts "response was empty"
when Success
  puts "response was a success"
end

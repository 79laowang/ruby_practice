#!/usr/bin/ruby
#1. 数组中每个元素乘以2
(1..10).map { |n| puts n * 2 }

#2. 数组中的元素求和
(1..1000).inject { |sum, n| sum + n }
#或使用（内置的）Symbol#to_proc语法，自Ruby 1.8.7之后可用：
(1..1000).inject(&:+)
# Or
(1..1000).inject(:+)
# Or
(1..1000).reduce(:+)

#3. 验证在字符串中是否有tokens存在
words = ["scala", "akka", "play framework", "sbt", "typesafe"]
tweet = "This is an example tweet talking about scala and sbt."

words.any? { |word| tweet.include?(word) }

#4.读取文件
file_text = File.read("/etc/os-release")
file_lines = File.readlines("/etc/os-release")

#后者包括“\n”在数组每个元素的末端，它可以通过附加 .map { |str| str.chop } 或者使用替代版本来做修整：

File.read("/etc/os-release").split(/\n/)

#5.生日快乐
4.times { |n| puts "Happy Birthday #{n==2 ? "dear Tony" : "to You"}" }

#6.过滤数组中的数字
[49, 58, 76, 82, 88, 90].partition { |n| n > 60 }

#7. Fibonacci Sequence 
def fib(n, h= n < 2? 1 : fib( n -1) + fib(n-2)); h; end
fib(20)

#8.在数组中查找最小（或最大）值
[14, 35, -7, 46, 98].min
[14, 35, -7, 46, 98].max

#9.并行处理
# require 'parallel'

# Parallel.map(lots_of_data) do |chunk|
  # heavy_computation(chunk)
# end

#10.Get prime
#Also ruby already contains library called “prime”.
require 'prime'
7.prime? # => true
9.prime? # => false
puts Prime.take(3) # => [2, 3, 5]


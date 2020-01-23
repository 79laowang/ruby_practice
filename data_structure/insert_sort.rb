#!/usr/bin/ruby
puts  "Insertion sorting:"
array = [7, 6, 5, 1, 8, 9]
puts "Original array:"
for i in (0...array.length)
  print array[i], " "
end
puts 
puts "Sorted array:"
for i in (0...array.length)
  for j in (i...array.length)
    array[i], array[j] = array[j], array[i] while array[i] < array[j]
  end
end

for i in (0...array.length)
  print array[i], " "
end

puts
puts "-"*20
puts "Another sorted array method:"
#short syntax
array = [7,6,5,1,8,9]
array.length.times { |i| i.upto(5){ |j|
        array[i], array[j] = array[j], array[i] while array[i] < array[j] }}
array.length.times { |i| print array[i], " "}

#!/usr/bin/ruby
array = [7, 6, 5, 1, 8, 9]

for i in (0..5)
  for j in (i..5)
    array[i], array[j] = array[j], array[i] while array[i] < array[j]
  end
end

for i in (0..5)
  print array[i], " "
end


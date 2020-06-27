#!/usr/bin/env ruby
# -*- coding:utf-8 -*-
#-------------------------------------------------------------------------------
# File Name:   loop.rb
# Purpose:     
#
# Author:      Ke Wang
#
# Created:     2020-06-27
# Copyright:   (c) Ke Wang 2020
# Licence:     <your licence>
#-------------------------------------------------------------------------------

print "--------------\n"
print "Ruby loop usage!\n"
print "--------------\n"

$i = 0
$num = 5

while $i < $num  do
  puts("In loop i = #$i")
  $i +=1
end

print "\n"
print "---------------\n"
print "Another loop usage:"
$j = 0
$num = 6
begin
  puts("In loop i = #$j")
  $j +=1
end while $j < $num

#!/usr/bin/env ruby
# -*- coding:utf-8 -*-
#-------------------------------------------------------------------------------
# File Name:   ruby-args.rb
# Purpose:    
#
# Author:      Ke Wang
#
# Created:     2020-01-20
# Copyright:   (c) Ke Wang 2020
# Licence:     <your licence>
#-------------------------------------------------------------------------------
require 'optparse'

# This will hold the options we parse
options = {}

OptionParser.new do |parser|

  parser.banner = "Usage: hello.rb [options]"
  parser.on("-h", "--help", "Show this help message") do || 
    puts parser
  end
  # Whenever we see -n or --name, with an
  # argument, save the argument.
  parser.on("-n", "--name NAME", "The name of the person to greet.") do |v|
    options[:name] = v
  end
  # Note the `Integer` arg. That tells the parser to cast the value to an int.
  # I could have used `Float`, `Date`, or a number of other types.
  parser.on("-c", "--count COUNT", Integer, "Repeat the message COUNT times") do |v|
    options[:count] = v
  end
end.parse!

# Now we can use the options hash however we like.
# puts "Hello #{ options[:name] }"  if options[:name]
if options[:name]
  options.fetch(:count, 1).times do
    puts "Hello #{ options[:name] }"
  end
end

# test: ruby ruby-args.rb -n Starr -c 5

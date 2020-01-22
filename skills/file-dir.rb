#!/usr/bin/env ruby
# -*- coding:utf-8 -*-
#-------------------------------------------------------------------------------
# File Name:   file-dir.rb
# Purpose:    
#
# Author:      Ke Wang
#
# Created:     2020-01-20
# Copyright:   (c) Ke Wang 2020
# Licence:     <your licence>
#-------------------------------------------------------------------------------

require 'net/http'

# Get file name ,extend name, path
puts __FILE__
puts File.dirname(__FILE__)
puts File.basename(__FILE__)
puts File.extname(__FILE__)
puts File.basename(__FILE__, ".*")
puts File.expand_path(File.dirname(__FILE__))

# With a relative path, Dir[] will return relative paths
# as `[ './myfile', ... ]`
#
Dir[ './*' ].select{ |f| File.file? f }.each do |f| 
  puts f
end

# Want just the filename?
# as: [ 'myfile', ... ]
#
Dir[ '../*' ].select{ |f| File.file? f }.map{ |f| File.basename f }.each do |f|
  puts f
end

# Turn them into absolute paths?
# [ '/path/to/myfile', ... ]
#
Dir[ '../*' ].select{ |f| File.file? f }.map{ |f| File.absolute_path f }.each do |f|
  puts f
end

# With an absolute path, Dir[] will return absolute paths:
# as: [ '/var/../var/test/myfile', ... ]
#
Dir[ '/var/../var/log/*' ].select{ |f| File.file? f }.each do |f|
  puts f
end

# Need the paths to be canonical?
# as: [ '/var/test/myfile', ... ]
#
Dir[ '/var/../var/log/*' ].select{ |f| File.file? f }.map{ |f| File.expand_path f }.each do |f|
  puts f
end


Net::HTTP.start("fedora.inode.at") do |http|
    resp = http.get("/releases/30/COMPOSE_ID")
    open("COMPOSE_ID", "wb") do |file|
        file.write(resp.body)
    end
end
puts "Done."


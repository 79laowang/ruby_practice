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

Net::HTTP.start("fedora.inode.at") do |http|
    resp = http.get("/releases/30/COMPOSE_ID")
    open("COMPOSE_ID", "wb") do |file|
        file.write(resp.body)
    end
end
puts "Done."


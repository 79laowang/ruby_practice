#!/usr/bin/env ruby
# -*- coding:utf-8 -*-
#-------------------------------------------------------------------------------
# File Name:   benchmark_list_file.rb
# Purpose:    
#
# Author:      Ke Wang
#
# Created:     2020-01-22
# Copyright:   (c) Ke Wang 2020
# Licence:     <your licence>
#-------------------------------------------------------------------------------

require 'benchmark'
base_dir = "/var/log"
n = 100
Benchmark.bm do |x|
  x.report("Dir[*]:") do
    i = 0
    n.times do
      i = i + Dir["#{base_dir}*"].select {|f| !File.directory? f}.length
    end
    puts " (#{i} files stepped over #{n} iterations)"
  end
  x.report("Dir.glob(*):") do
    i = 0
    n.times do
      i = i + Dir.glob("#{base_dir}/*").select {|f| !File.directory? f}.length
    end
    puts " (#{i} files stepped over #{n} iterations)"
  end
  x.report("Dir.entries():") do
    i = 0
    n.times do
      i = i + Dir.entries(base_dir).select {|f| !File.directory? File.join(base_dir, f)}.length
    end
    puts " (#{i} files stepped over #{n} iterations)"
  end
  x.report("Dir[**/*]:") do
    i = 0
    n.times do
      i = i + Dir["#{base_dir}**/*"].select {|f| !File.directory? f}.length
    end
    puts " (#{i} files stepped over #{n} iterations)"
  end
  x.report("Dir.glob(**/*):") do
    i = 0
    n.times do
      i = i + Dir.glob("#{base_dir}**/*").select {|f| !File.directory? f}.length
    end
    puts " (#{i} files stepped over #{n} iterations)"
  end
  x.report("Dir.entries() recursive walk:") do
    i = 0
    n.times do
      def walk_dir(dir, result)
        Dir.entries(dir).each do |file|
          next if file == ".." || file == "."

          path = File.join(dir, file)
          if Dir.exist?(path)
            walk_dir(path, result)
          else
            result << file
          end
        end
      end
      result = Array.new
      walk_dir(base_dir, result)
      i = i + result.length
    end
    puts " (#{i} files stepped over #{n} iterations)"
  end
  x.report("Dir.glob(**/*, File::FNM_DOTMATCH):") do
    i = 0
    n.times do
      i = i + Dir.glob("#{base_dir}**/*", File::FNM_DOTMATCH).select {|f| !File.directory? f}.length
    end
    puts " (#{i} files stepped over #{n} iterations)"
  end
end

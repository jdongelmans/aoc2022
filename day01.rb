#!/usr/bin/ruby

elves = File.read("inputs/01.txt").split("\n\n")
total_per_elf = elves.map { |elf| elf.split("\n").map(&:to_i).sum }

puts "Day01::Part01: #{total_per_elf.max}"
puts "Day01::Part02: #{total_per_elf.max(3).sum}"

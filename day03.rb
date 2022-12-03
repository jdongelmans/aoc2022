#!/usr/bin/ruby

rucksacks = File.readlines("inputs/03.txt")

values = rucksacks.map do |rucksack|
  compartment1, compartment2 = rucksack.scan(/.{#{rucksack.length / 2}}/)
  ord = (compartment1.chars & compartment2.chars)[0].ord
  ord >= 97 ? ord - 96 : ord - 38
end

puts "Day02::Part01: #{values.sum}"

# ==============================================================================

values = rucksacks.each_slice(3).map do |group|
  ord = group.map(&:chars).inject(&:&)[0].ord
  ord >= 97 ? ord - 96 : ord - 38
end

puts "Day02::Part02: #{values.sum}"

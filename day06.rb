#!/usr/bin/ruby

def find_index(length)
  input = File.read("inputs/06.txt").chars
  _, index = input.each_cons(length).with_index.find { |group, _index| group.uniq.count == length }
  index + length
end

puts "Day06::Part01: #{find_index(4)}"

# ==============================================================================

puts "Day06::Part02: #{find_index(14)}"

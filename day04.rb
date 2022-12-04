#!/usr/bin/ruby

inputs = File.readlines("inputs/04.txt")
range_pairs = inputs.map { |pair| pair.split(',').map { |x| Range.new(*x.split('-').map(&:to_i)) } }

overlaps = range_pairs.count do |range_a, range_b|
  range_a.cover?(range_b) || range_b.cover?(range_a)
end

puts "Day04::Part01: #{overlaps}"

# ==============================================================================

overlaps = range_pairs.count do |range_a, range_b|
  (range_a.to_a & range_b.to_a).any?
end

puts "Day04::Part02: #{overlaps}"

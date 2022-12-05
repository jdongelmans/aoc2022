#!/usr/bin/ruby

inputs = File.read("inputs/05.txt")
stacks, moves = inputs.split("\n\n")

stacks = stacks.split("\n").reverse.map { |line| line.scan(/\w|\d| {4}/) }
stacks.shift # remove the array of numbers
stacks = stacks.map do |array|
  array.push(" ") until array.size == stacks.map(&:length).max
  array
end
stacks = stacks.transpose.map { |array| array.reject { |e| e.strip.empty? } }

def move(stacks, move)
  count, from, to = move.scan(/\d+/).map(&:to_i)
  count.times do
    element = stacks[from - 1].pop
    stacks[to - 1].push(element)
  end
end

part1_stacks = stacks.map(&:dup)
moves.split("\n").each { |move| move(part1_stacks, move) }

puts "Day05::Part01: #{part1_stacks.map(&:last).join}"

# ==============================================================================

def move_v2(stacks, move)
  count, from, to = move.scan(/\d+/).map(&:to_i)
  elements = stacks[from - 1].pop(count)
  stacks[to - 1].push(*elements)
end

part2_stacks = stacks.map(&:dup)
moves.split("\n").each { |move| move_v2(part2_stacks, move) }

puts "Day05::Part02: #{part2_stacks.map(&:last).join}"

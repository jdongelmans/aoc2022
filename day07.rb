#!/usr/bin/ruby

inputs = File.readlines("inputs/07.txt")

dir_sizes = Hash.new(0)
pwd = []

inputs.each do |line|
  command = line.split

  if line.start_with?('$ cd')
    case arg = command.last
    when '/'
      pwd.clear
      pwd.push(arg)
    when '..'
      pwd.pop
    else
      pwd.push(arg)
    end
  else
    1.upto(pwd.length) do |i|
      key = pwd.first(i).join('/')
      dir_sizes[key] += command.first.to_i
    end
  end
end

puts "Day07::Part01: #{dir_sizes.values.select { |v| v < 100000 }.sum}"

# ==============================================================================

disk_needed = 30_000_000 - (70_000_000 - dir_sizes['/'])
puts "Day07::Part02: #{dir_sizes.values.select { |v| v > disk_needed }.min}"

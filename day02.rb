#!/usr/bin/ruby

input = File.readlines("inputs/02.txt")

MAPPING = {
  'A' => 1,
  'B' => 2,
  'C' => 3,
  'X' => 1,
  'Y' => 2,
  'Z' => 3
}

def game_score(opponent, you)
  if (you + opponent == 4) && (you && opponent != 2)
    6 if you == 1
  elsif you > opponent
    6
  elsif opponent == you
    3
  end || 0
end

rounds = input.map do |round|
  opponent, you = round.split(' ').map { |sign| MAPPING.fetch(sign) }

  game_score(opponent, you) + you
end

puts "Day02::Part01: #{rounds.sum}"

# ==============================================================================

MAPPING = {
  'A' => 1,
  'B' => 2,
  'C' => 3,
  'X' => :lose,
  'Y' => :draw,
  'Z' => :win
}

rounds = input.map do |round|
  opponent, outcome = round.split(' ').map { |sign| MAPPING.fetch(sign) }

  case outcome
  when :lose
    you = opponent - 1
  when :draw
    you = opponent
  when :win
    you = opponent + 1
  end

  case you
  when 4
    you -= 3
  when 0
    you += 3
  end

  game_score(opponent, you) + you
end

puts "Day02::Part02: #{rounds.sum}"

#!/usr/bin/ruby

input = File.readlines("inputs/02.txt")

def game_score(opponent, you)
  score = 0
  score += 3 if you == opponent
  score += 6 if (you - opponent) % 3 == 1
  score
end

PART_1_MAPPING = {
  'A' => 1,
  'B' => 2,
  'C' => 3,
  'X' => 1,
  'Y' => 2,
  'Z' => 3
}

rounds = input.map do |round|
  opponent, you = round.split(' ').map { |sign| PART_1_MAPPING.fetch(sign) }

  game_score(opponent, you) + you
end

puts "Day02::Part01: #{rounds.sum}"

# ==============================================================================

PART_2_MAPPING = {
  'A' => 1,
  'B' => 2,
  'C' => 3,
  'X' => -1,
  'Y' => 0,
  'Z' => 1
}

rounds = input.map do |round|
  opponent, outcome = round.split(' ').map { |sign| PART_2_MAPPING.fetch(sign) }
  you = opponent + outcome

  case you
  when 4
    you -= 3
  when 0
    you += 3
  end

  game_score(opponent, you) + you
end

puts "Day02::Part02: #{rounds.sum}"

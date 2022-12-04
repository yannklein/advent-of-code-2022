# PART 1

# shape_scores = {
#   A: 1,
#   B: 2,
#   C: 3
# }

# shape_matches = {
#   X: "A",
#   Z: "C", 
#   Y: "B"
# }

# game_scores = {
#   "AA": 3, 
#   "BB": 3, 
#   "CC": 3, 
#   "BC": 6, 
#   "AB": 6, 
#   "CA": 6, 
# }

# total_score = 0

# File.foreach("day2.data") { |line| 
#   # p line.chomp
#   picks = line.chomp.split(" ")
#   picks[1] = shape_matches[picks[1].to_sym]
#   played_hand = picks.join("")
#   # p played_hand
#   score = 
#     shape_scores[picks[1].to_sym] + ( game_scores[played_hand.to_sym] || 0)
#   # p score
#   total_score += score
# }

# p total_score


# PART 2

shape_scores = {
  A: 1,
  B: 2,
  C: 3
}

def lose(hand)
  hands = ["A", "C", "B"] # Rock < Paper < Scissor
  index = hands.index(hand)
  return (index + 1 < hands.size) ? hands[index + 1] : hands[0]
end

def win(hand)
  hands = ["A", "C", "B"] # Rock < Paper < Scissor
  index = hands.index(hand)
  return (index - 1 >= 0)  ? hands[index - 1] : hands[-1]
end

def your_move(hand, outcome)
  humanized_outcome = {
    X: :lose,
    Y: :draw,
    Z: :win 
  }

  case humanized_outcome[outcome.to_sym]
  when :win
    return win(hand)
  when :lose
    return lose(hand)
  else :draw
    return hand
  end
end

game_scores = {
  "AA": 3, 
  "BB": 3, 
  "CC": 3, 
  "BC": 6, 
  "AB": 6, 
  "CA": 6, 
}

total_score = 0

File.foreach("day2.data") { |line| 
  # p line.chomp
  their_pick, outcome = line.chomp.split(" ")
  your_pick = your_move(their_pick, outcome)
  played = "#{their_pick}#{your_pick}"
  score = 
  shape_scores[your_pick.to_sym] + ( game_scores[played.to_sym] || 0)
  p [line, their_pick, your_pick, played, outcome, score]
  # p score
  total_score += score
}

p total_score
# PART 1

# total_prio = 0

# File.foreach("day3.data") { |line| 
#   # p line.chomp
#   rucksack = line.chomp
#   comp1 = rucksack[...(rucksack.size / 2)].split("")
#   comp2 = rucksack[(rucksack.size / 2)..].split("")
#   wrong_placed = comp1.intersection(comp2)[0]
#   priorities = [0] + ('a'..'z').to_a + ('A'..'Z').to_a
#   p rucksack, comp1, comp2, wrong_placed, priorities.index(wrong_placed)
#   total_prio += priorities.index(wrong_placed)
# }

# p total_prio

# PART 2

rucksack = []
total_prio = 0

File.foreach("day3.data") { |line| 
  # p line.chomp
  rucksack << line.chomp.split("")
}

rucksack.each_slice(3) do |group|
  badge = group[0].intersection(group[1]).intersection(group[2])[0]
  priorities = [0] + ('a'..'z').to_a + ('A'..'Z').to_a
  total_prio += priorities.index(badge)
  p group, badge, priorities.index(badge)
end

p total_prio
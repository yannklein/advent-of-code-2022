# PART 1

# biggest_total_calorie = 0 
# current_total_calorie = 0

# File.foreach("day1.data") { |line| 
#   # p line.chomp
#   if line.chomp != ""
#     current_total_calorie += line.chomp.to_i
#   else
#     biggest_total_calorie = current_total_calorie if current_total_calorie >= biggest_total_calorie
#     current_total_calorie = 0
#   end
# }

# p biggest_total_calorie

# PART 2

calories_per_elf = [] 
current_total_calorie = 0

File.foreach("day1.data") { |line| 
  # p line.chomp
  if line.chomp != ""
    current_total_calorie += line.chomp.to_i
  else
    calories_per_elf << current_total_calorie
    current_total_calorie = 0
  end
}

p calories_per_elf.sort.reverse.first(3).sum
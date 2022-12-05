# PART 1

# count = 0

# File.foreach("day4.data") { |line|
#   # p line.chomp
#   section1, section2 = line.chomp.split(",").map do |section|
#     Range.new(*section.split("-").map(&:to_i)).to_a
#   end
#   p section1.join('-'), section2.join('-'), section1 - section2, section2 - section1
#   if section1 - section2 == [] || section2 - section1 == []
#     p 'counted'
#     count += 1
#   end
# }

# p count

# PART 2

count = 0

File.foreach("day4.data") { |line|
  # p line.chomp
  section1, section2 = line.chomp.split(",").map do |section|
    Range.new(*section.split("-").map(&:to_i)).to_a
  end
  p section1.join("-"), section2.join("-"), section1.intersection(section2)
  if section1.intersection(section2) != []
    p "counted"
    count += 1
  end
}

p count

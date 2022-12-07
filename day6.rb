# PART 1

# File.foreach("day6.data") { |line|
#   buffer = line.chomp
#   p buffer
  
#   buffer.split("").each_with_index do |char, index|
#     four_chars = buffer[index...index + 4].split("")
#     p four_chars
#     if four_chars.uniq.size == four_chars.size
#       p index + 4
#       break
#     end
#   end
# }

# PART 2

File.foreach("day6.data") { |line|
  buffer = line.chomp
  p buffer
  
  buffer.split("").each_with_index do |char, index|
    four_chars = buffer[index...index + 14].split("")
    p four_chars
    if four_chars.uniq.size == four_chars.size
      p index + 14
      break
    end
  end
}


# PART 1

count = 0
stack_phase = true

STACKS = []

def build_stacks(line)
  line.split("").each_slice(4).with_index do |crate, index|
    matching_crate = crate.join.match(/[(\w)]/)
    next if matching_crate.nil?
    STACKS[index + 1] = STACKS[index + 1].nil? ? matching_crate[0] : STACKS[index + 1] + matching_crate[0]
  end
end

def move_stacks(line)
  _, number, start_pos, end_pos = line.match(/move (\d+) from (\d+) to (\d+)/).to_a.map(&:to_i)
  p number, start_pos, end_pos
  # isolate and reverse stack to move
  stack_to_move = STACKS[start_pos][...number]
  p stack_to_move
  # remove stack to move from current stack
  STACKS[start_pos] = STACKS[start_pos][number..]
  # add it to the next one
  STACKS[end_pos] = stack_to_move + STACKS[end_pos]
  p STACKS
end

File.foreach("day5.data") { |line|
  p line.chomp
  if line.chomp == "" || line.chomp[0] == " "
    stack_phase = false
    p "stack ended"
    p STACKS
    next
  end
  if stack_phase
    build_stacks(line.chomp)
  else
    move_stacks(line.chomp)
  end
}

p STACKS
p STACKS[1..].map{ |stack| stack[0]}.join
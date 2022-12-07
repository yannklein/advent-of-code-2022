# PART 1

class FilePath
  attr_accessor :name, :size, :parent, :sub_files
  def initialize(name, parent = nil, size = 0)
    @name = name
    @size = size
    @parent = parent
    @sub_files = []
  end
  
  def total_size
    size.zero? ? @sub_files.sum { |sub_f| sub_f.total_size} : size
  end
end

root = FilePath.new("root")

bucket = []

current_dir = root

File.foreach("day7.data") { |line|
  line = line.chomp
  # p line
  line_array = line.split(" ")
  if line_array[2] == ".."
    # p "open dir"
    # p "old dir", current_dir
    current_dir = current_dir.parent
    # p "new dir", current_dir
  elsif line_array[1] == "cd"
    # p "open dir"
    # p "old dir", current_dir
    current_dir = current_dir.sub_files.find { |sf| sf.name == line_array[2]}
    # p "new dir", current_dir
  elsif line_array[0] == "dir"
    # p "current_dir", current_dir
    new_dir = FilePath.new(line_array[1], current_dir)
    bucket << new_dir
    current_dir.sub_files << new_dir
  elsif line_array[0].to_i != 0
    new_dir = FilePath.new(line_array[1], current_dir, line_array[0].to_i)
    bucket << new_dir
    current_dir.sub_files << new_dir
    # p current_dir.sub_files
  end
}
# p root
# p root.total_size

# p "grand total"
# select_buckets = bucket.select { |dirs| dirs.total_size <= 100000 && dirs.sub_files != []}
# p select_buckets.count
# select_buckets.each { |dir| p "#{dir.name}, #{dir.total_size}" }
# p select_buckets.sum { |dirs| dirs.total_size }

p root.total_size
p "empty space"
p empty = 70000000 - root.total_size
p "to be empty space"
p to_be_emptied = 30000000 - empty

select_buckets = bucket.select { |dirs| dirs.total_size >= 7870454 && dirs.sub_files != []}
select_buckets.each { |d| p d.total_size }
min_dirs = select_buckets.map { |dir| dir.total_size }
p "min"
p min_dirs.min

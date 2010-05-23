#!/usr/bin/ruby

# the file where the list will be stored
filepath = File.expand_path('~/Documents/todo.txt')
# index corresponding to the task number to be removed
index = 0
# line of text that will be added to the end of the list
add = ''
# the lines that are read in from the existing file, then later written
lines = ''

# if the file holding the list already exists, get its contents
if File::exists?(filepath)
  f = File.open(filepath, 'r')
  lines = f.readlines()
  f.close()
end

# if there are no arguments we'll just remove the first item from the list
if ARGV.length == 0
  index = 1
# if the user types 'dun skip' we'll move the first item to the end of the list
elsif ARGV[0] == 'skip'
  index = 1
  add = lines[0]
# if the user types 'dun add' followed by some text, add the text to the list
elsif ARGV[0] == 'add' and ARGV.length > 1
  add = ARGV[1]
# otherwise we assume the user has typed 'dun' followed by some integer
# corresponding to the item number from the list to be removed
else
  begin
    index = Integer(ARGV[0])
  # if the number typed isn't an integer
  rescue
    puts('Is it really so hard?')
  end
end

# now we open the file for writing
f = File.open(filepath, 'w')

# cycle through the lines
i = 0
lines.each do |line|
  i += 1
  # i equals index when we reach a line to be removed, so we skip writing it
  if i == index
    next
  # otherwise we write the line to the file
  else
    f.puts(line)
  end
end
# if there is a line to be added to the end of the list, then do so
if add != ''
  f.puts(add)
end

# fin
f.close()

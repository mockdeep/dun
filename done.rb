#!/usr/bin/env ruby
index = 0
add = ''
f = File.open('todo.txt', 'r')
lines = f.readlines()
f.close()
if ARGV.length == 0
  index = 1
elsif ARGV[0] == 'skip'
  index = 1
  add = lines[0]
elsif ARGV[0] == 'add' and ARGV.length > 1
  add = ARGV[1]
elsif ARGV[0].isnum()
  index = ARGV[0]
end
f = File.open('todo.txt', 'w')
i = 0
lines.each do |line|
  i += 1
  if i == index
    next
  else
    f.puts(line)
  end
end
if add != ''
  f.puts(add)
end
f.close()


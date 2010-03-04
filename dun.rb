#!/usr/bin/ruby
filepath = File.expand_path('~/Documents/todo.txt')
index = 0
add = ''
lines = ''
if File::exists?(filepath)
  f = File.open(filepath, 'r')
  lines = f.readlines()
  f.close()
end

if ARGV.length == 0
  index = 1
elsif ARGV[0] == 'skip'
  index = 1
  add = lines[0]
elsif ARGV[0] == 'add' and ARGV.length > 1
  add = ARGV[1]
else
  begin
    index = Integer(ARGV[0])
  rescue
    puts('Is it really so hard?')
  end
end

f = File.open(filepath, 'w')
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

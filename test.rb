VALID_DIRECTION = %w( w s a d )
puts 'Press W,A,S,D to move and "q" to quit'
loop do  
  system("stty raw -echo")
  char = STDIN.read_nonblock(1) rescue nil
  system("stty -raw echo")
  break if /q/i =~ char
case char
when *VALID_DIRECTION
  puts "valid"
else  
end
  sleep(1)
end


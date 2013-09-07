
class Game	
	@map
	@coordinates
	

	def initialize(map)
		@map = map
		@coordinates = man_position(map)
		
	end	


	def man_position(map)
		i=0
		map.each do |linhas|
			if !linhas.index('@').nil?
				coordinates = [i,linhas.index('@')]
				return coordinates
			end	
			i += 1
		end 
	end	
   

   #mover @ de acordo com o movimento
   def move(direction)
   	case direction
   	when 'a'
   		clear(@coordinates[0],@coordinates[1]-1)
   	when 'd'
   		clear(@coordinates[0],@coordinates[1]+1)
   	when 's'
   		clear(@coordinates[0]+1,@coordinates[1])
   	when 'w'
   		clear(@coordinates[0]-1,@coordinates[1])
   	end

     	render()
   end

   def clear(x,y)
   	if @map[x][y] == '#'
   		return false
   	end
   	if @map[x][y] == ' '
   		return move_space(x,y)
   	end
   	if @map[x][y] == 'o'
   		return move_box
   	end
   if @map[x][y] == '.'
   		return move_storage
   	end
      	
   end

   #imprimir mapa
   def render
   	puts "\n"
   	puts @map
   end

   def move_space(x,y)   		
   	  @map[x][y] = '@'
   	  @map[@coordinates[0]][@coordinates[1]] = ' '
   	  @coordinates[0] = x
   	  @coordinates[1] = y
   end
   
   def move_box
   	return true
   end

   def move_storage
   	return false
   end



end	



f = open("/home/lucas/level1.txt")
array = []
f.each_line {	
 	|line| array << line
  }
f.close
sokoban = Game.new(array)


VALID_DIRECTION = %w( w s a d )
puts 'Press W,A,S,D to move and "q" to quit'
loop do  
  system("stty raw -echo")
  char = STDIN.read_nonblock(1) rescue nil
  system("stty -raw echo")
  break if /q/i =~ char
case char
when *VALID_DIRECTION
  sokoban.move(char)
else  
end
  sleep(1)
end




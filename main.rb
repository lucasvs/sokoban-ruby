
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
   		clear(@coordinates[0],@coordinates[1],'left')
   	when 'd'
   		clear(@coordinates[0],@coordinates[1],'right')
   	when 's'
   		clear(@coordinates[0],@coordinates[1],'down')
   	when 'w'
   		clear(@coordinates[0],@coordinates[1],'up')
   	end

     	render()
   end

   def clear(x,y,pos)
      
   	case pos
   	when 'left'
   		two = y - 1
   		one = x
   	when 'right'
   		two = y + 1
   		one = x
   	when 'down'
   		one = x + 1
   		two = y
   	when 'up'
   		one = x - 1
   		two = y
   	end 


   	if @map[one][two] == '#'
   		return false
   	end
   	if @map[one][two] == ' '
   		return move_space(x,y,pos)
   	end
   	if @map[one][two] == 'o'
   		return move_box(one,two,pos)
   	end
   if @map[one][two] == '.'
   		return move_storage
   	end
      	
   end

   #imprimir mapa
   def render
   	puts "\n"
   	puts @map
   end

   def move_space(x,y,pos)  
   	case pos
   	when 'left'
   		two = y - 1
   		one = x
   	when 'right'
   		two = y + 1
   		one = x
   	when 'down'
   		one = x + 1
   		two = y
   	when 'up'
   		one = x - 1
   		two = y
   	end 

   if  @map[x][y] == '@'
   	  @map[one][two] = '@'
   	  @map[@coordinates[0]][@coordinates[1]] = ' '
   	  @coordinates[0] = one
   	  @coordinates[1] = two
   	  return true
   end 

     if  @map[x][y] == 'o' 
   	  @map[one][two] = 'o'
   	  @map[x][y] = ' '
   	  return true
   end		

   end
   
   def move_box(x,y,pos)
   	  if clear(x,y,pos)
   	  	clear(@coordinates[0],@coordinates[1],pos)
   	  	return true
   	  end
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
sokoban.move(' ')
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
  #sleep(1)
end




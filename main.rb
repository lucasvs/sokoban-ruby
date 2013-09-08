
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

	def win?(map)
		found = true
		map.each do |linhas|
			if !linhas.index('.').nil?
				found = false
			end				
		end
     return found
	end	
   

   #mover @ de acordo com o movimento
   def position(direction)
   	if !win?(@map)
   	case direction
   	when 'a'
   		move(@coordinates[0],@coordinates[1],'left')
   	when 'd'
   		move(@coordinates[0],@coordinates[1],'right')
   	when 's'
   		move(@coordinates[0],@coordinates[1],'down')
   	when 'w'
   		move(@coordinates[0],@coordinates[1],'up')
   	end
   	render()
   elsif 
   		puts "\n"
     	puts "++++++++ WIN ++++++++" 
   end
   	

     	
     	if win?(@map)
     		puts "\n"
     		puts "++++++++ WIN ++++++++"     	
     	end
   end

   def move(x,y,pos)
      
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
   		return move_box(one,two,pos,@map[x][y])
   	end
   if @map[one][two] == '.'
   		return move_space(x,y,pos)
   	end
   	if @map[one][two] == '*'
   		return move_storage(one,two,pos)
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

   if  @map[x][y] == '@' && @map[one][two] == ' ' 
   	  @map[one][two] = '@'   	  
   	  @map[x][y] = ' '   	   	  
   	  @coordinates[0] = one
   	  @coordinates[1] = two
   	  return true
   end 

     if  @map[x][y] == 'o' && @map[one][two] == ' '
   	  @map[one][two] = 'o'
   	  @map[x][y] = ' '
   	  return true
   end	

      if  @map[x][y] == 'o' && @map[one][two] == '.'
   	  @map[one][two] = '*'
   	  @map[x][y] = ' '
   	  return true
   end	

   if  @map[x][y] == '@' && @map[one][two] == '.'
   	  @map[one][two] = '+'
   	  @map[x][y] = ' '
   	  @box = true
   	  @coordinates[0] = one
   	  @coordinates[1] = two
   	  return true
   end	

      if  @map[x][y] == '+' && @map[one][two] == ' ' 
   	  @map[one][two] = '@'   	  
   	  @map[x][y] = '.'   	   	  
   	  @coordinates[0] = one
   	  @coordinates[1] = two
   	  return true
   end 



    if  @map[x][y] == '+' && @map[one][two] == '.' 
   	  @map[one][two] = '+'   	  
   	  @map[x][y] = '.'   	   	  
   	  @coordinates[0] = one
   	  @coordinates[1] = two
   	  return true
   end 



    if  @map[x][y] == '*' && @map[one][two] == '.' 
   	  @map[one][two] = '*'   	  
   	  @map[x][y] = '.'
   	  return true
   end 

    if  @map[x][y] == '*' && @map[one][two] == 'o' 
   	  return false
   end 

    if  @map[x][y] == '*' && @map[one][two] == '*' 
   	  return false
   end 

   end
   
   def move_box(x,y,pos,type)   

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
   	if(type == '@' && (@map[one][two] == ' ' || @map[one][two] == '.'))
   	  if move(x,y,pos)
   	  	move(@coordinates[0],@coordinates[1],pos)
   	  	return true
   	  end
   	end
   end

      def move_storage(x,y,pos)      	
   	  if move(x,y,pos)
   	  	move(@coordinates[0],@coordinates[1],pos)
   	  	return true
   	  end
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

end	



f = open("/home/lucas/level1.txt")
array = []
f.each_line {	
 	|line| array << line
  }
f.close
sokoban = Game.new(array)


VALID_DIRECTION = %w( w s a d )
puts 'Press W,A,S,D to move and "r" to restart, "q" to quit'
sokoban.position(' ')
loop do  
  system("stty raw -echo")
  char = STDIN.read_nonblock(1) rescue nil
  system("stty -raw echo")
  break if /q/i =~ char
  if char == 'r'
   sokoban = Game.new(array)
  end
case char
when *VALID_DIRECTION
  sokoban.position(char)
else  
end
  #sleep(1)
end





class Game	
	attr_reader :map

	def initialize(map)
		@map = map
		@x = man_position(map)[0]
		@y = man_position(map)[1]
	end	


	def man_position(map)
		i=0
		map.each do |linhas|
			if !linhas.index('@').nil?
				coordinates = [linhas.index('@'),i]
				return coordinates
			end	
			i += 1
		end 
	end	
   
   def x
   		@x
   end

   #mover @ de acordo com o movimento
   def move(direction)
   	case direction
   	when 'a'
   		puts "left"
   	when 'd'
   		puts "right"
   	when 's'
   		puts "down"
   	when 'w'
   		puts "up"
   	end

     	render()
   end

   #imprimir mapa
   def render
   	puts @map
   end

   def move_man
   end
   
   def move_box
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




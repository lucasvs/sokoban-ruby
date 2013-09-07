class Sokoban
	attr_reader :map

	def initialize(map)
		@map = map
		@man = man_position(map)
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
   
   def man
   		@man
   end

   #mover @ de acordo com o movimento
   def move
   end

   #imprimir mapa
   def render
   end
   
end	
f = open("/home/lucas/level1.txt")
array = []
f.each_line {	
 	|line| array << line
  }
f.close
sokoban = Sokoban.new(array)
puts "#{sokoban.man}"


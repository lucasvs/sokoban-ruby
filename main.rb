class Sokoban
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
   def move
   	render()
   end

   #imprimir mapa
   def render
   	puts @map
   end
   
end	


f = open("/home/lucas/level1.txt")
array = []
f.each_line {	
 	|line| array << line
  }
f.close
sokoban = Sokoban.new(array)
sokoban.move



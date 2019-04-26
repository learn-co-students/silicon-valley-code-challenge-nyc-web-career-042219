class VentureCapitalist

	attr_reader :name, :total_worth

	@@all=[]

	def initialize(name, total_worth)
		@name = name
		@total_worth = total_worth
		@@all << self
	end

	def self.all 
		@@all
	end

	def self.tres_commas_club
		self.all.select { |vc| vc.total_worth > 1000000000}
	end



end

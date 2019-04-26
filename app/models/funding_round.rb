class FundingRound

	attr_reader :startup, :venture_capitalist, :investment
	attr_accessor :type

	@@all = []
	def initialize(startup, venture_capitalist, investment)
		@startup = startup
		@venture_capitalist = venture_capitalist
		@investment = investment.to_f
		@@all << self
	end

	def self.all
		@@all
	end


end

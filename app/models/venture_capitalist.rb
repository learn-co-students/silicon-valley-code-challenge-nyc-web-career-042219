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

	def offer_contract(startup, type, investment)
		fundinground = FundingRound.new(self, startup, investment)
		fundinground.type = type
	end


	def funding_rounds
		FundingRound.all.select do |fr|
			fr.venture_capitalist == self
		end
	end

	def portfolio
		array = FundingRound.all.map do |fr|
		if fr.venture_capitalist == self
				fr.startup
			end
		end.compact
		array.uniq
	end

	def biggest_investment
		largestsum = 0
		round = nil
		array = FundingRound.all.each do |fr|
			if fr.venture_capitalist== self && fr.investment > largestsum
				largestsum = fr.investment 
				round = fr
			end
		end
		round
	end

	def invested(domain)
		totalinvestment = 0
		FundingRound.all.each do |fr|
			if fr.startup.domain == domain
			totalinvestment += fr.investment
			end
		end
		totalinvestment
	end



end

class Startup

	attr_accessor :name
	attr_reader :founder, :domain

	@@all = []

	def initialize(founder, domain)
		@founder = founder
		@domain = domain
		@@all << self
	end

	def pivot(domain_name, new_name)
		@domain = domain_name
		@name = new_name
	end

	def self.all 
		@@all
	end

	def self.find_by_founder(founder)
		self.all.find { |startup| startup.founder == founder}
	end

	def self.domains
		self.all.map do |startup|
			startup.domain
		end
	end

	def sign_contract(vc, type, investment)
		fundinground = FundingRound.new(self, vc, investment)
		fundinground.type = type
	end

	def num_funding_rounds
		FundingRound.all.select do |fr|
			fr.startup == self
		end.length
	end

	def total_funds
		investment_total = 0
		FundingRound.all.each do |fr|
		 if	fr.startup == self
		 	investment_total += fr.investment
		 end
		end
		investment_total
	end

	def investors
		array = FundingRound.all.map do |fr|
			if fr.startup == self
				fr.venture_capitalist
			end
		end
		array.uniq
	end

	def big_investors
		array = FundingRound.all.map do |fr|
			if fr.startup == self && VentureCapitalist.tres_commas_club.include?(fr.venture_capitalist) 
				fr.venture_capitalist
			end
		end
		array.uniq
	end



end

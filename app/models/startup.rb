class Startup
attr_accessor :name
attr_reader :founder, :domain


@@all = []

def initialize(name, founder, domain)
  @name = name
  @founder = founder
  @domain = domain
  @@all << self
end

def pivot(domain, name)
  @domain = domain
  @name = name
end



def find_by_founder(founder)
  self.all.find { |startup| startup.founder == founder }
end

#////////// INTERACTIVE METHODS /////////////

def sign_contract(vc, type, investment_amount)
  funding = FundingRound.new(self, vc, type, investment_amount)
end

def num_funding_rounds
  self.funding_rounds.length
end

def funding_rounds
  FundingRound.all.select { |round| round.startup == self }
end

def total_funds
  total = 0
  self.funding_rounds.each {|rounds| total += rounds.investment}
  return total
end

def investors
  self.funding_rounds.map {|rounds_funded| rounds_funded.vc}.uniq
end

def big_investors
  self.investors.select {|investor| VentureCapitalist.tre_commas_club.include?(investor) }
end


#////////// CLASS METHODS ////////////////

def self.all
  @@all
end





end

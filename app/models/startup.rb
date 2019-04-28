class Startup
  attr_accessor :name, :domain
  attr_reader :founder

  @@all = []

  def initialize(name, founder, domain)
    @name = name
    @founder = founder
    @domain = domain

    @@all << self
  end

  def pivot(domain, name)
    self.domain = domain
    self.name = name
  end

  def self.all
    @@all
  end

  def self.find_by_founder(founder_name)
    @@all.find {|startup| startup.founder == founder_name}
  end

  def self.domains
    result = []
    @@all.each {|startup| result << startup.domain}
    result
  end

  def sign_contract(vc, type, amount)
      new_contract = FundingRound.new(self, vc, type, amount)
  end

  def total_rounds
    FundingRound.all.select {|round| round.startup == self}
  end

  def num_funding_rounds
    rounds = self.total_rounds
    rounds.length
  end

  def total_funds
    total = 0.0
    rounds = self.total_rounds
    rounds.each {|round| total += round.investment}
    total
  end

  def investors
    rounds = self.total_rounds
    rounds.map {|round| round.venture_capitalist}
  end

  def big_investors
    rounds = self.total_rounds
    result = []
    rounds.each {|round| result << round if VentureCapitalist.tres_commas_club.include?(round.venture_capitalist);binding.pry}
    result
  end
end

class Startup

  @@all = []

  attr_reader :founder
  attr_accessor :name, :domain

  def initialize(name, founder, domain)
    @name = name
    @domain = domain
    @founder = founder
    @@all << self
  end

  def pivot(name, domain)
    @name = name
    @domain = domain
  end

  def sign_contract(vc, type, amount)
    FundingRound.new(self, vc, type, amount)
  end

  def num_funding_rounds
    FundingRound.all.select {|round| round.startup == self}
  end

  def total_funds
    sum = 0.0
    num_funding_rounds.each {|round| sum += round.investment}
    sum
  end

  def investors
    num_funding_rounds.map {|round| round.venture_capitalist.name}.uniq
  end

  def big_investors
    num_funding_rounds.select {|round| VentureCapitalist.tres_commas_club.include?(round.venture_capitalist)}
  end

  #CLASS METHODS
  def self.find_by_founder(founder_name)
    @@all.find {|startup| startup.founder == founder_name}
  end

  def self.domains
    @@all.map {|startup| startup.domain}
  end

  def self.all
    @@all
  end

end

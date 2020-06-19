class Startup

  attr_accessor :name
  attr_reader :founder, :domain

  @@all = []

  def initialize(name, founder, domain)
    @name = name
    @founder = founder
    @domain = domain
    self.class.all << self
  end

  def pivot(domain, name)
    @domain = domain
    @name = name
  end

  def sign_contract(venture_cap, type, amt)
    FundingRound.new(venture_cap, self, type, amt)
  end

  def funding_rounds
    FundingRound.all.select { |round| round.startup == self }
  end

  def num_funding_rounds
    funding_rounds.length
  end

  def total_funds
    funding_rounds.map { |round| round.investment }.sum
  end

  def investors
    funding_rounds.map { |round| round.venture_capitalist }.uniq
  end

  def big_investors
    investors.select { |investor| investor.class.tres_commas_club }
  end

  def self.all
    @@all
  end

  def self.find_by_founder(founder)
    self.all.find{ |startup| startup.founder == founder }
  end

  def self.domains
    self.all.select{ |startup| startup.domain}.uniq
  end

end
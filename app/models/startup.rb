class Startup

  attr_reader :name, :founder, :domain
  @@all = []

  def initialize(name, founder, domain)
    @name = name
    @founder = founder
    @domain = domain
    @@all << self
  end

  def pivot(name, domain)
    @name = name
    @domain = domain
  end

  def self.find_by_founder(founder)
    self.all.find do |startup|
      startup.founder == founder
    end
  end

  def self.domains
    self.all.map do |startup|
      startup.domain
    end
  end

  def sign_contract(vc_object, type, investment)
    FundingRound.new(self, vc_object, type, investment)
  end

  def num_funding_rounds
    FundingRound.all.select do |fr|
      fr.startup == self
    end.count
  end

  def helper_funding_rounds
    FundingRound.all.select do |fr|
      fr.startup == self
    end
  end

  def total_funds
    helper_funding_rounds.map do |fr|
      fr.investment
    end.sum
  end

  def investors
    helper_funding_rounds.map do |fr|
      fr.venture_capitalist
    end.uniq
  end

  def big_investors
    investors.select do |investor|
      investor.total_worth > 1000000000
    end
  end

  def self.all
    @@all
  end


end

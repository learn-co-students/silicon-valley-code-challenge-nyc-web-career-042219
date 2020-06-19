require 'pry'

class Startup
attr_reader :founder, :domain, :funding_rounds
attr_accessor :name
@@all = []

def initialize(name, founder, domain)
    @name = name
    @founder = founder
    @domain = domain
    @@all << self
  end

def self.all
  @@all
  end

def domain=(domain)
  @domain = domain
  end

def pivot(name, domain)
  @name = name
  @domain = domain
  @funding_rounds = []
end

def self.find_by_founder(founder)
  Startup.all.select do |startup|
    if startup.founder == founder
      startup
      end
    end
  end

def self.domains
  domain_array = []
  Startup.all.each do |startup|
    domain_array << startup.domain
    end
    domain_array
  end

def sign_contract(venture_capitalist, funding_series, deal_amount)
  if deal_amount.class == Integer
    deal_amount = deal_amount.to_f
    end
  FundingRound.new(self, venture_capitalist, funding_series, deal_amount)
  end

  def num_funding_rounds
    num_rounds = []
    FundingRound.all.select do |round|
    if round.startup.founder == @founder
        num_rounds << round
      end
    end
    num_rounds.length
  end

  def total_funds
    funds = 0
    FundingRound.all.select do |round|
      if round.startup.founder == @founder
        funds += round.investment
      end
    end
    funds
  end


  def investors
    invested_people = []
    FundingRound.all.select do |round|
      if round.startup.name == @name
        invested_people << round.venture_capitalist.name
      end
    end
    invested_people.uniq
  end

  def big_investors
    billionaire_investors = []
    FundingRound.all.select do |round|
      if round.venture_capitalist.worth >= 1000000000
        billionaire_investors << round.venture_capitalist.name
      end
    end
    billionaire_investors.uniq
  end
end

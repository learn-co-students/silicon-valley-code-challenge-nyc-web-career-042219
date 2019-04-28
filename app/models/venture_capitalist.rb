require 'pry'
class VentureCapitalist
  attr_reader :name, :total_worth, :worth

  @@all = []

  def self.all
    @@all
  end

  def initialize(name, num)
    @name = name
    @worth = num
    @@all << self
  end

  def total_worth
    self.worth
  end

  def self.tres_commas_club
    VentureCapitalist.all.select do |billionaire|
      if billionaire.worth >= 1000000000
        billionaire
      end
    end
  end

  def offer_contract(startup, series, deal_amount)
    if deal_amount.class == Integer
      deal_amount = deal_amount.to_f
    end
    FundingRound.new(startup, self, series, deal_amount)
  end

  def funding_rounds
    rounds_funded = []
    FundingRound.all.select do |round|
      if round.venture_capitalist.name == @name
        rounds_funded << round
      end
    end
    rounds_funded.length
  end

  def portfolio
    startups_funded = []
    FundingRound.all.select do |round|
      if round.venture_capitalist.name == @name
        startups_funded << round.startup.name
      end
    end
    startups_funded.uniq
  end

  def biggest_investment
    investments = []
    FundingRound.all.select do |round|
      if round.venture_capitalist.name == @name
        investments << round.investment
      end
    end
    investments.max
  end

  def invested(domain)
    sector_investment = 0
    FundingRound.all.select do |round|
      if round.startup.domain == domain && round.venture_capitalist.name == @name
        sector_investment += round.investment
      end
    end
    sector_investment
  end
end

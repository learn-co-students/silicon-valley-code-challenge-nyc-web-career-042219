class VentureCapitalist
  attr_accessor :name, :total_worth

  @@all = []

  def initialize(name, total_worth)
    @name = name
    @total_worth = total_worth

    @@all << self
  end

  def self.all
    @@all
  end

  def self.tres_commas_club
    @@all.select {|vc| vc.total_worth > 1000000000 }
  end

  def offer_contract(startup, type, amount)
    new_contract = FundingRound.new(startup, self, type, amount)
  end

  def funding_rounds
    FundingRound.all.select {|round| round.venture_capitalist == self}
  end

  def portfolio
    rounds = self.funding_rounds
    rounds.map {|round| round.startup}
  end

  def biggest_investment
    self.funding_rounds.max {|a, b| a.investment <=> b.investment}
  end

  def invested(domain)
    total = 0
    rounds = self.funding_rounds
    rounds.each {|round| total += round.investment if round.startup.domain == domain}
    total
  end
end

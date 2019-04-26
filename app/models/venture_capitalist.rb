class VentureCapitalist

  @@all = []
  attr_accessor :name, :total_worth, :funding_rounds, :portfolio

  def initialize(name, total_worth)
    @name = name
    @total_worth = total_worth
    @funding_rounds = []
    @portfolio = []
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

    self.funding_rounds << new_contract
    self.portfolio << startup

    startup.investors << self
    startup.big_investors << self if VentureCapitalist.tres_commas_club.include?(vc)
    startup.num_funding_rounds += 1
    startup.total_funds += amount
  end

  def biggest_investment
    self.funding_rounds.max {|a, b| a.investment <=> b.investment}
  end

  def invested(domain)
    total = 0

    startups = self.portfolio.select {|startup| startup.domain == domain}
    binding.pry
    startups.each {|startup| total += startup.total_funds}

    total
  end
end

class VentureCapitalist

  attr_accessor :total_worth
  attr_reader :name

  @@all = []

  def initialize(name)
    @name = name
    @total_worth = 0
    @@all << self
  end

  def self.all
    @@all
  end

  def self.tres_commas_club
    self.all.select do |venture_capital|
      venture_capital.total_worth > 1000000000
    end
  end

  def offer_contract(startup, type, investment)
    type = FundingRound.new(startup, self, type, investment)
  end

  def funding_rounds
    FundingRound.all.select {|funding_round| funding_round.venture_capitalist == self }
  end

  def portfolio
    self.funding_rounds.map{|f_r| f_r.startup}.uniq
  end

  def biggest_investment
    counter = 0
    self.funding_rounds.each do |f_r|
      if counter < f_r.investment
        counter = f_r.investment
      end
    end
    counter
  end

  def invested(domain)
    startups = FundingRound.all.select {|f_r| f_r.venture_capitalist == self && f_r.startup.domain == domain }
    # startups = investment.map {|investment| investment.startup }
    # startup_domain = startups.select { |startup| startup.domain == domain }
    investment = startups.map {|startup| startup.investment }
    investment.sum
  end
end

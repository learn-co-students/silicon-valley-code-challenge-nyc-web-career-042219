class VentureCapitalist

  attr_accessor :name, :total_worth

  @@all = []

  def initialize(name, total_worth)
    @name = name
    @total_worth = total_worth
    @@all << self
  end

  def offer_contract(startup, type, amount)
    FundingRound.new(startup, self, type, amount)
  end

  def funding_rounds
    FundingRound.all.select {|round| round.venture_capitalist == self}
  end

  def portfolio
    self.funding_rounds.map {|round| round.startup.name}.uniq
  end

  def biggest_investment
    funding_rounds.max_by {|round| round.investment}
  end

  def invested(domain)
    total = 0
    funding_rounds.each {|round| total += round.investment if round.startup.domain == domain}
    total
  end


  # CLASS METHODS

    def self.all
      @@all
    end

    def self.tres_commas_club
      @@all.select {|vc| vc.total_worth > 1000000000}
    end


end

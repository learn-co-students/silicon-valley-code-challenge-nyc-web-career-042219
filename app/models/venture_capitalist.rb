class VentureCapitalist

  @@all = []

  def self.all
    @@all
  end

  def self.tres_commas_club
    self.all.select { |venture_cap| venture_cap.total_worth > 1_000_000_000 }
  end

  attr_reader :name
  attr_accessor :total_worth

  def initialize(name)
    @name = name
    @total_worth = 0
    self.class.all << self
  end

  def offer_contract(startup, type, amt)
    self.total_worth += amt
    FundingRound.new(self, startup, type, amt)
  end

  def funding_rounds
    FundingRound.all.select { |round| round.venture_capitalist == self }
  end

  def portfolio
    funding_rounds.map { |round| round.startup }.uniq
  end

  def biggest_investment
    max = 0
    funding_rounds.each { |round| max = round.investment if round.investment > max }
    max
  end

  def invested(domain)
    sum = 0
    domain_rounds = FundingRound.all.select { |round| round.startup.domain == domain }
    # arr of funding round which startup domains match the passed in domain
    domain_rounds.each { |round| sum += round.investment }
    sum
  end

end

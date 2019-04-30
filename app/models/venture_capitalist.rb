class VentureCapitalist

  attr_reader :name
  attr_accessor :total_worth

  @@all = []

  def initialize(name)
    @total_worth = 0
    @name = name
    @@all << self
  end

    # Class methods
  def self.all
    @@all
  end

  def self.tres_commas_club
      # go through all venture_capitalist
      # see which  ones are for tres commas club
    self.all.select{|vc| vc.total_worth > 1000000}
  end

    # INSTANCE methods

  def offer_contract(startup, type, amount)
    FundingRound.new(startup, self, type, amount)
  end

  def funding_rounds
    FundingRound.all.select { |fr| fr.venture_capitalist == self}
  end

  def portfolio
    self.funding_rounds.map { |fr| fr.startup}.uniq
  end

  def biggest_investment
    self.funding_rounds.sort { |x, y| y.investment_amount <=> x.investment_amount }.first
  end

  def invest(domain)
    var = self.funding_rounds.select { |fr| fr.startup.domain == domain}
    var.collect { |fr| fr.investment_amount}.sum
  end

end

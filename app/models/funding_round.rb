class FundingRound

  attr_reader :startup, :venture_capitalist, :type
  attr_accessor :investment_amount

  @@all = []

  def initialize(startup, venture_capitalist, type, amount)
    @startup = startup
    @venture_capitalist = venture_capitalist
    @type = type
    @investment_amount = amount
    @@all << self #this may need to change later
  end

  def investment
    if self.investment_amount < 0
      self.investment_amount = 0
    else
      self.investment_amount
    end
  end

  def self.all
    @@all
  end

end

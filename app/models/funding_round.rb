# join table
# in the initialize, instance of 2 other classes

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


# Instance Methods

  def investment
    if self.investment_amount < 0
      self.investment_amount = 0
    else
      self.investment_amount
    end
  end

# Class Methods

  def self.all
    @@all
  end

end

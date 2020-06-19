class FundingRound
  attr_reader :startup, :venture_capitalist
  attr_accessor :type, :investment
  @@funding_rounds = []

  def initialize(startup, venture_capitalist, type, investment)
    @startup = startup
    @venture_capitalist = venture_capitalist
    @type = type
    @investment = investment.abs.to_f           # works, but legit?
    @@funding_rounds << self
  end

  def self.all
    @@funding_rounds
  end

end

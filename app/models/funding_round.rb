class FundingRound
  attr_reader :startup, :venture_capitalist, :type
  attr_accessor :investment

  @@all = []

  def initialize(startup, venture_capitalist, type, investment)
    @startup = startup
    @venture_capitalist = venture_capitalist
    @type = type
    @investment = investment
    @@all << self
  end

  def investment=(investment)
    if @investment < 0.0
      @investment = 0.0
    end
  end

  def self.all
    @@all
  end

end

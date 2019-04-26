class FundingRound
  @@all = []

  def self.all
    @@all
  end

  attr_reader :startup, :venture_capitalist, :startup, :investment
  attr_accessor :type

  def initialize(venture_cap, startup, type, invest)
    @venture_capitalist = venture_cap
    @startup = startup
    @type = type
    @investment = invest >= 0 ? invest.to_f : 0.0#.investment
    self.class.all << self
  end

  # def investment
  #   @investment >= 0 ? @investment.to_f : "Error"
  # end


end

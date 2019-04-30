class FundingRound

  attr_reader :startup, :venture_capitalist
  attr_accessor :type, :investment

  @@all = []

  def initialize(startup, vc, type, investment)
    @startup = startup
    @venture_capitalist = vc
    @type = type
    @investment = investment.to_f
    @@all << self
  end


  #CLASS METHODS

  def self.all
    @@all
  end

end

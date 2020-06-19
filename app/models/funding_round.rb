require 'pry'
class FundingRound
attr_accessor :startup, :venture_capitalist
attr_reader :investment, :type

@@all = []

def initialize(startup, venture_capitalist, type, investment)
  @startup = startup
  @venture_capitalist = venture_capitalist
  @type = type
  @investment = investment
  @@all << self
  end

  def self.all
    @@all
  end

  def type=(type)
    @type = type
  end

  def investment=(investment)
    @investment = investment
  end

end

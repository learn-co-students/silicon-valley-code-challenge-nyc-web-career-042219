class FundingRound

attr_reader :startup, :vc, :investment
attr_accessor :type

@@all = []

  def initialize(startup, vc, type, investment)
    @startup = startup
    @vc = vc
    @type = type
    self.investment = (investment)
    @@all << self
  end

  def investment=(amount)
    @investment = amount
    @investment.to_f
    if @investment < 0
      @investment = 0.to_f
    end
    @investment
  end

  def self.all
    @@all
  end


end

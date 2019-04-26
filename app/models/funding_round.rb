class FundingRound

# attr_accessor
attr_reader :startup, :vc, :type, :investment

@@all = []

def initialize(startup, vc, type, investment = 0)
  @startup = startup
  @vc = vc
  @type = type
  @investment = investment
  @@all << self
end



def self.all
  @@all
end

def investment
  @investment.to_f
end











end

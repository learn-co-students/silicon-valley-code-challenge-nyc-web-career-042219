
class Startup

  attr_reader :founder
  attr_accessor :domain, :name

  @@all = []

  def initialize(name, founder, domain)
    @name = name
    @founder = founder
    @domain = domain
    @@all << self
  end
# Instance Methods

  def pivot(name, domain)
    self.name = name
    self.domain = domain
  end

  def sign_contract(venture_capitalist, type, amount)
    FundingRound.new(self, venture_capitalist, type, amount)
  end

  def num_funding_rounds
    FundingRound.all.select { |fr| fr.startup == self}.length
  end

  def total_funds
    round = FundingRound.all.select { |fr| fr.startup == self}
    round.map {|round| round.investment_amount}.sum
  end

  def investors
    fundr= FundingRound.all.select { |fr| fr.startup == self}
    fundr.map {|fr| fr.venture_capitalist }.uniq
  end

  def big_investors
    uniq_inv = self.investors
    tres = VentureCapitalist.tres_commas_club
    uniq_inv.select { |inv| tres.include?(inv) }
  end

# Class Methods

  def self.all
    @@all
  end

  def self.find_by_founder(founder)
    self.all.find{|startup| startup.founder == founder}
  end

  def self.domains
    self.all.map{|startup| startup.domain}
  end



end

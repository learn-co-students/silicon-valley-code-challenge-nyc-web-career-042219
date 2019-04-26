class Startup
  attr_accessor :name, :domain, :num_funding_rounds, :total_funds, :investors, :big_investors
  attr_reader :founder

  @@all = []
  
  def initialize(name, founder, domain)
    @name = name
    @founder = founder
    @domain = domain
    @investors = []
    @big_investors = []
    @total_funds = 0
    @num_funding_rounds = 0

    @@all << self
  end

  def pivot(domain, name)
    self.domain = domain
    self.name = name
  end

  def self.all
    @@all
  end

  def self.find_by_founder(founder_name)
    @@all.find {|startup| startup.founder == founder_name}
  end

  def self.domains
    result = []
    @@all.each {|startup| result << startup.domain}
    result
  end

  def sign_contract(vc, type, amount)
      new_contract = FundingRound.new(self, vc, type, amount)

      self.investors << vc
      self.big_investors << vc if VentureCapitalist.tres_commas_club.include?(vc)
      self.num_funding_rounds += 1
      self.total_funds += amount

      vc.portfolio << self
      vc.funding_rounds << new_contract
  end
end

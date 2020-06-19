class Startup

attr_reader :name,:founder,:domain

@@all = []

  def initialize(name,founder,domain)
  @name = name
  @founder = founder
  @domain = domain
  @@all << self
  end

  def pivot(domain,name)
    @name = name
    @domain = domain
  end

  def self.all
    @@all
  end

  def self.find_by_founder(founder)
    self.all.find {|x| founder == x.founder}
  end

  def self.domains
    self.all.map {|x| x.domain}
  end

  #interclass methods

  def sign_contract(vc,type,investment)
    new_funding = FundingRound.new(self,vc,type,investment)
  end

  def num_funding_rounds
    self.funding_rounds.length
  end

  def funding_rounds
    FundingRound.all.select {|funding_instance| funding_instance.startup == self}
  end

  def total_funds
    total = 0
    self.funding_rounds.each {|funding_instance| total += funding_instance.investment}
    total
  end

  def investors
    self.funding_rounds.map {|funding_instance| funding_instance.venture_capitalist}.uniq
  end

  def big_investors
    self.investors.select {|vc_instance| VentureCapitalist.tres_commas_club.include?(vc_instance)}.uniq
  end

  
end

class VentureCapitalist

  attr_reader :name, :total_worth
  @@all = []


  def initialize(name,total_worth)
    @name = name
    @total_worth = total_worth
    @@all << self
  end

  def self.all
    @@all
  end

  def self.tres_commas_club
    self.all.select {|x| x.total_worth.count(",") >= 3}
  end

  #Interclass methods

  def offer_contract(startup,type,investment)
  sp = FundingRound.new(startup,self,type,investment)
  end

  def funding_rounds
  FundingRound.all.select {|fr_objects| fr_objects.venture_capitalist == self}
  end

  def portfolio
      self.funding_rounds.map {|fr_obj| fr_obj.startup}.uniq
  end

  def biggest_investment
    biggest_i = 0
    self.funding_rounds.each {|fr_obj| biggest_i = fr_obj.investment if fr_obj.investment > biggest_i }
    biggest_i
  end

  def invested(domain)
    sum_inv = 0
    domain_rounds = self.funding_rounds.select{|fr_obj|fr_obj.startup.domain == domain}
    domain_rounds.each {|dr| sum_inv += dr.investment}
    sum_inv
  end 

end

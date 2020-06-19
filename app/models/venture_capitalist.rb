class VentureCapitalist

  attr_accessor :total_worth
  attr_reader :name

  @@all = []

  def initialize(name, total_worth = 0)
    @name = name
    @total_worth = total_worth
    @@all << self

  end

  def self.tre_commas_club
    self.all.select { |vc| vc.total_worth >= 1000000000 }
  end

  def offer_contract(startup, type, amount)
    funding = FundingRound.new(startup, self, type, amount)
  end

  def funding_rounds
    FundingRound.all.select { |round| round.vc == self }
  end

  def portfolio
    self.funding_rounds.map { |round| round.startup }.uniq
  end

  def invested(domain)
      total_in_domain = 0
      self.rounds_in_domain(domain).each {|round| total_in_domain += round.investment}
      return total_in_domain
  end


  def rounds_in_domain(domain)
      self.funding_rounds.select { |round| round.startup.domain == domain }
  end


  def self.all
    @@all
  end

end

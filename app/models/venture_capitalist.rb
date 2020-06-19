class VentureCapitalist

  attr_accessor :name, :worth

  @@all = []

  def initialize(name, worth)
    @name = name
    @worth = worth
    @@all << self
  end

  def self.all
    @@all
  end

  def self.tres_commas_club
    self.all.select do |vc|
      vc.worth > 1000000000
    end
  end

  def offer_contract (startup, type, amount)
    FundingRound.new(startup, self, type, amount)
  end

  def funding_rounds
    FundingRound.all.select do |rounds|
      rounds.vc == self
     end
  end

  def portfolio
    FundingRound.all.select do |rounds|
      rounds.vc == self
    end.map do |rounds_startup|
      rounds_startup.startup.name
    end.uniq
  end

  def biggest_investment
    FundingRound.all.select do |rounds|
      rounds.vc == self
    end.sort_by{|rounds| rounds.investment}.reverse.first
  end

  def invested (domain)
    sum = 0
    FundingRound.all.select do |rounds|
      rounds.startup.domain == domain
    end.map do |rounds_domain|
      rounds_domain.investment
    end.each do |investment|
      sum += investment
    end
    sum
  end

end

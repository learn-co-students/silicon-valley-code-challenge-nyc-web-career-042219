class VentureCapitalist

  attr_reader :name, :total_worth
  @@all = []

  def initialize(name, total_worth)
    @name = name
    @total_worth = total_worth
    @@all << self
  end

  def self.tres_commas_club
    self.all.select do |vc|
      vc.total_worth > 1000000000
    end
  end

  def offer_contract(s_object, type, investment)
    FundingRound.new(s_object, self, type, investment)
  end

  def funding_rounds
    FundingRound.all.select do |fr|
      fr.venture_capitalist == self
    end
  end

  def portfolio
    funding_rounds.map do |fr|
      fr.startup
    end.uniq
  end

  def biggest_investment
    funding_rounds.max_by do |fr|
      fr.investment
    end
  end

  def invested(domain)
    FundingRound.all.map do |fr|
      fr.investment
    end.sum
  end

  def self.all
    @@all
  end


end

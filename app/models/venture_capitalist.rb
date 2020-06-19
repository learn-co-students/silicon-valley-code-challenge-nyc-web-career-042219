class VentureCapitalist
  attr_reader
  attr_accessor :name, :total_worth
  @@vcs = []

  def initialize(name, total_worth)
    @name = name
    @total_worth = total_worth
    @@vcs << self
  end

  def self.all
    @@vcs
  end

  def self.tres_commas_club
    all.select do |vc|
      vc.total_worth > 1000000000
    end
  end

  def offer_contract(startup, type, investment)
    FundingRound.new(startup, self, type, investment)
  end

  def funding_rounds
    FundingRound.all.select do |round|
      round.venture_capitalist == self
    end
  end

  def portfolio
    funding_rounds.map do |fr|
      round.startup
    end.uniq
  end

  def biggest_investment
    funding_rounds.reduce do |memo, round|
      memo.investment > round.investment ? memo : round
    end
  end

  def domain_investments(domain)
    funding_rounds.select do |round|
      round.startup.domain == domain
    end
  end

  def invested(domain)
    domain_investments(domain).reduce(0) do |sum, round|
      sum += round.investment
    end
  end

end

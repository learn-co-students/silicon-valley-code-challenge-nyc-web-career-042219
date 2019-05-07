class Startup

  attr_reader :name, :founder
  attr_accessor :domain, :name

  @@all = []

  def initialize(name, founder, domain)
    @name = name
    @founder = founder
    @domain = domain
    @@all << self
  end

  def pivot(domain, name)
    self.domain = domain
    self.name = name
  end

  def self.all
    @@all
  end

  def self.find_by_founder(founder)
    self.all.find do |startup|
      if startup.founder == founder
        startup
      end
    end
  end

  def self.domains
    self.all.map {|st| st.domain}
  end

  def sign_contract(venture_capitalist, type, investment)
    type = FundingRound.new(self, venture_capitalist, type, investment)
  end

  def num_funding_rounds
    FundingRound.all.select{|funding_round| funding_round.startup == self}.count
  end

  def total_funds
    funds = FundingRound.all.select{|funding_round| funding_round.startup == self}
    total_f = funds.map{|fund| fund.investment}
    total_f.sum
  end

  def investors
    new_array = []
    FundingRound.all.select do |funding_round|
      funding_round.startup == self ? new_array << funding_round.venture_capitalist : nil
    end
    new_array.uniq
    end

    def big_investors
      new_array = []
      self.investors.select {|investor| VentureCapitalist.tres_commas_club.include?(investor) ? new_array << investor : nil}
      new_array.uniq
    end

end

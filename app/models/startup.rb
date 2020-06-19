class Startup

attr_reader :founder, :domain
attr_accessor :name

@@all = []

  def initialize (name, founder, domain)
    @name = name
    @founder = founder
    @domain = domain
    @@all << self
  end

  def pivot (domain, name )
    @name = name
    @domain = domain
  end

  def self.all
    @@all
  end

  def self.find_by_founder(name)
    self.all.find do |startup|
      startup.founder == name
    end
  end

  def self.domains
    self.all.map do |startup|
      startup.domain
    end
  end

  def sign_contract (vc,type, amount)
    FundingRound.new(self, vc, type, amount)
  end

  def num_funding_rounds
    FundingRound.all.select do |fund_round|
      fund_round.startup == self
    end.length
  end

  def total_funds
    funds = 0
    FundingRound.all.each do |round|
      binding.pry
    if round.startup == self
       funds += round.investment
     end
   end
    return funds
  end

  def investors
    FundingRound.all.select do |round|
      round.startup == self
    end.map do |startup_round|
      startup_round.vc.name
    end.uniq
  end

  def big_investors
    FundingRound.all.select do |round|
      round.startup == self
    end.select do |round_startup|
      round_startup.vc.worth > 1000000000
    end.map do |startup_round|
      startup_round.vc.name
    end.uniq
  end



end

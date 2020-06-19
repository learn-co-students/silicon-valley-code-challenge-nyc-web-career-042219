require_relative 'venture_capitalist'
require_relative 'funding_round'
require 'pry'

class Startup
  attr_reader :founder, :domain
  attr_accessor :name
  @@startups = []

  def initialize(name, founder, domain)
    @name = name
    @founder = founder
    @domain = domain
    @@startups << self
  end

  def self.all
    @@startups
  end

  def pivot(domain, name)
    @domain = domain
    @name = name
  end

  def self.find_by_founder(founder_name)
    all.find do |startups|
      startup.founder = founder_name
    end
  end

  def self.domains
    all.map do |startups|
      startup.domain
    end
  end

  def sign_contract(venture_capitalist, type, investment)
    FundingRound.new(self, venture_capitalist, type, investment)
  end

  def funding_rounds
    FundingRound.all.select do |round|
      round.startup == self
    end
  end

  def num_funding_rounds
    funding_rounds.count
  end

  def total_funds
    funding_rounds.reduce(0) do |sum, fr|
      sum += fr.investment
    end
  end

  def investors
    funding_rounds.map do |fr|
      fr.venture_capitalist
    end.uniq
  end

  def big_investors
    investors.select do |vc|
      VentureCapitalist.tres_commas_club.include?(vc)
    end
  end

end


# TESTS

binky = Startup.new("Binkycom", "John Bink", "General Etail")
books = Startup.new("Bookscom", "Tony Bookman", "Book Etail")

bonk = VentureCapitalist.new("Jim Bonk", 1000000)
blam = VentureCapitalist.new("Frank Blam", 2000000000)
bingo = VentureCapitalist.new("Tom Bingo", 5000000000)

binky.sign_contract(bonk, "Round-1", 50000)
binky.sign_contract(bonk, "Round-4", -49999)
blam.offer_contract(binky, "Round-2", 60000)
blam.offer_contract(books, "Round-3", 70000)

puts bonk.biggest_investment

binding.pry

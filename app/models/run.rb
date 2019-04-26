require 'pry'

require_relative "./funding_round.rb"
require_relative "./venture_capitalist.rb"
require_relative './startup.rb'


# binding.pry




bumpy_steel = Startup.new("Bumpy Steel ", "Gabbie", "animals")

cheese = Startup.new("cheese", "Zach", "fashion")

star_wars = Startup.new("star wars", "Alex", "fashion")

bumpy_steel.pivot("cars", "vroom")



# binding.pry #test new  startup + pivot


jed = VentureCapitalist.new("jed", 15000000000)

augustus = VentureCapitalist.new("Augustus", 600)

adam = VentureCapitalist.new("Adam", 1500000000)

crazy_guy_tim = VentureCapitalist.new("Tim", 1500009848172348917230487123047123400000)

# binding.pry #test new VCs

bumpy_steel_round1 = FundingRound.new(bumpy_steel, jed, "personal", 100)

bumpy_steel_round2 = FundingRound.new(bumpy_steel, augustus, "personal", 200)

star_wars_round1 = FundingRound.new(star_wars, augustus, "personal", 300)

star_wars_round2 = FundingRound.new(star_wars, adam, "personal", 300)

cheese_round2 = FundingRound.new(cheese, adam, "personal", 5000)

#binding.pry

 jed.invested("cars")

 jed.invested("parrots")

 adam.invested("fashion")

 # binding.pr #test to see from mulitple domain


 bumpy_steel.num_funding_rounds

 bumpy_steel.funding_rounds

 bumpy_steel.investors

 bumpy_steel.big_investors


binding.pry #
















# binding.pry #test joint table




















binding.pry

0

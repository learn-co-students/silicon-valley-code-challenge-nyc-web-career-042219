require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
#startups (name, founder, domain)

zocdoc = Startup.new("ZocDoc", "Oliver", "health")
skimm = Startup.new("Skimm", "Carly", "news")

# VentureCapitalist (name, total_worth)
capital1 =VentureCapitalist.new("Capital 1", 10_000)
capital2 = VentureCapitalist.new("Capital 2", 15_000)

# funding_rounds (startup, venture_capitalist, type, investment)
f1 =FundingRound.new(zocdoc, capital1, "sea1", 500)
f2 =FundingRound.new(skimm, capital1, "sea1", 450)
f3 = FundingRound.new(zocdoc, capital2, "sea1", 500)
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

binding.pry
0 #leave this here to ensure binding.pry isn't the last line

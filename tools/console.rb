require 'pry'

require_relative '../config/environment.rb'
require_relative '../app/models/startup.rb'
require_relative '../app/models/funding_round.rb'
require_relative '../app/models/venture_capitalist.rb'

# startup has many funding_rounds
# startup has many venture_capitalists through funding_rounds

# venture_capitalist has mnay funding_rounds
# venture_capitalist has many startups through funding_rounds

# funding_round belongs to startup (it is initializes with a startup)
# funding_round belongs to venture_capitalist (it is initialized with a venture_capitalist)

facebook = Startup.new("facebook", "Mark Zucc", "social media")
zocdoc = Startup.new("ZocDoc", "Kharraz", "healthcare")
twitter = Startup.new("twitter", "Jack Dorsey", "social media")

sequoia = VentureCapitalist.new("sequoia", 978930350)
tribeca = VentureCapitalist.new("tribeca", 2000000000)
andressen_horowitz = VentureCapitalist.new("andressen & horowitz", 2500000000)


funding_round_1 = FundingRound.new(facebook, sequoia, "Series A", 50000000)
funding_round_2 = FundingRound.new(twitter, tribeca, "Series B", 100000000)
funding_round_3 = FundingRound.new(zocdoc, andressen_horowitz, "Series C", 25000000)

facebook.sign_contract(sequoia, "Series A", 100000000)
twitter.sign_contract(tribeca, "Series B", 25000000)

sequoia.offer_contract(facebook, "Series B", 100000000)
tribeca.offer_contract(zocdoc, "Series A", 25000000)

facebook.num_funding_rounds
twitter.num_funding_rounds
zocdoc.num_funding_rounds

#andressen_horowitz.fund(facebook)
#andressen_horowitz.fund(twitter)

#sequoia.fund(facebook)
#sequoia.fund(twitter)

#tribeca.fund(zocdoc)


#series_a = FundingRound.new("series_a")
#series_b = FundingRound.new("series_b")

#tech.funding_round_venture_capitalist(sequoia)
#tech.funding_round_venture_capitalist(tribeca)
#
#tech_b.funding_round_venture_caspitalist()





# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

binding.pry
0#leave this here to ensure binding.pry isn't the last line

require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

amazon = Startup.new("Amazon", "Jeff B", "slack.com" )
facebook = Startup.new("Facebook", "Mark Z", "amazon.com")
twitter = Startup.new("Twitter", "Jack D", "twitter.com")

mark_cuban = VentureCapitalist.new("Mark Cuban", 30000000)
scrooge_mcduck = VentureCapitalist.new("Scrooge McDuck", 5000000000)
bill_murray = VentureCapitalist.new("Bill Murray", 1000000000)

round_one = FundingRound.new(facebook, mark_cuban, "Angel", 50000)
round_two = FundingRound.new(twitter, scrooge_mcduck, "Seed", 1000000)
round_three = FundingRound.new(twitter, bill_murray, "Type-A", 450000)
round_four = FundingRound.new(amazon, mark_cuban, "Type-A", 3000000)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line

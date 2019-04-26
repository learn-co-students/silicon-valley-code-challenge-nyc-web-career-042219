require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
facebook = Startup.new("Facebook", "Mark", "facebook.com")
twitter = Startup.new("Twitter", "Jack", "twitter.com")

rich_rick = VentureCapitalist.new("Rick", 2000000000)
buffet = VentureCapitalist.new("Buffet", 999000000)


round1= FundingRound.new(facebook, buffet, "Angel", -100 )
round2= FundingRound.new(facebook, rich_rick, "Pre-Seed", 1000.02)

round3 = FundingRound.new(twitter, buffet, "Seed", 10000)
round4 = FundingRound.new(twitter, rich_rick, "Angel", 1000000)
round5 = FundingRound.new(twitter, rich_rick, "Seed", 1000000)
binding.pry
0 #leave this here to ensure binding.pry isn't the last line

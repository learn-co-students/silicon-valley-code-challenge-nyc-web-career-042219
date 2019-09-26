require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

facebook = Startup.new("Facebook", "Mark", "Facebook.com")
twitter = Startup.new("Twitter", "Jess", "Twitter.com")
instagram = Startup.new("Instagram", "Jenn", "Instagram.com")

vc1 = VentureCapitalist.new("Matt", 2000000000)
vc2 = VentureCapitalist.new("Mike", 2000)
vc3 = VentureCapitalist.new("Sabrina", 3416)

fr1 = FundingRound.new(facebook, vc1, "Seed", 10000)
fr2 = FundingRound.new(twitter, vc1, "Apple", 1234)
fr3 = FundingRound.new(twitter, vc1, "Lame", 10000000)




binding.pry
0 #leave this here to ensure binding.pry isn't the last line

require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

#Startup Objects
apple = Startup.new("Apple","Steve Jobs","www.apple.com")
ruby = Startup.new("Ruby","Joshua Lagan","www.ibm.com/ruby")

#VentureCapitalist Objects

mcuban = VentureCapitalist.new("Mark Cuban","1,000,000,000")
cduncan = VentureCapitalist.new("Christian Duncan","1,000")

#FundingRound Objects
fund1 = FundingRound.new(apple,cduncan,"Angel",200.0)
fund2 = FundingRound.new(apple,mcuban,"Angel",500.0)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line

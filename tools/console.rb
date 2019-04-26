require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end


cellcases = Startup.new("Awesome Cases!","Oscar","www.casescases.com")
stpjs = Startup.new("Star Trek Pajamas", "Jake", "wwww.stpjs.com")
qun = Startup.new("star", "Qun", "www.moon.cn")

hi = VentureCapitalist.new("sds")
a = VentureCapitalist.new("a")
b = VentureCapitalist.new("b")
c = VentureCapitalist.new("c")

a.total_worth = 3000000
b.total_worth = 5000000
c.total_worth = 4

funda = FundingRound.new(stpjs, a, "typea", 1000.00)
fundb = FundingRound.new(qun, a, "typeb", 200.00)
fundb1a = FundingRound.new(qun, a, "typeb", 100.00)
fundb1b = FundingRound.new(qun, a, "typeb", 500.00)
fundb1c = FundingRound.new(qun, b, "typeb", 200.00)
fundc = FundingRound.new(cellcases, b, "typec", 300.00)

# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

binding.pry
0 #leave this here to ensure binding.pry isn't the last line

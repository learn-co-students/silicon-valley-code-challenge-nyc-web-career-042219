require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

kane_co = Startup.new("Kane", "kane.com")
kane_co.name = "Mr. Kane"

carly_cap = VentureCapitalist.new("Carly", 1000000000000)
zach_cap = VentureCapitalist.new("Zach", 100000)

kane_co.sign_contract(carly_cap, "Series A", 50)
kane_co.sign_contract(carly_cap, "Series A", 70)
kane_co.sign_contract(zach_cap, "Series B", 50)


binding.pry
0 #leave this here to ensure binding.pry isn't the last line
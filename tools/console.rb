require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

startup = Startup.new("ABC", "Jim", "Alphabet")
startup2 = Startup.new("DFG", "Jim2", "Alphabet")
startup3 = Startup.new("XYZ", "Jim3", "Domain")

vc1 = VentureCapitalist.new("VC1", 1000000001)
vc2 = VentureCapitalist.new("VC2", 5000000)

startup.sign_contract(vc1, "Series A", 1000.0)
startup.sign_contract(vc2, "Series B", 101.2)
startup2.sign_contract(vc1, "Series C", 1001.5)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line

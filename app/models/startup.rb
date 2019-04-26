class Startup

attr_reader :name, :founder
attr_accessor :domain, :name

@@all = []
@@all_domains = []

def initialize(name, founder, domain)
  @name = name
  @founder = founder
  @domain = domain
  @@all << self
  @@all_domains << domain
end

def name
  @name
end

def founder
  @founder
end

def pivot(domain, name)
  self.domain = domain
  self.name = name
end

def self.all
  @@all
end

def self.find_by_founder(founder)
  Startup.all.find do |startup|
    if startup.founder == founder
      startup.name
    end
  end
end

def self.domains
  @@all_domains
end


end

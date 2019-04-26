class VentureCapitalist

  attr_accessor :total_worth
  attr_reader :name

  @@all = []

  def initialize(name, total_worth)
    @name = name
    @total_worth = total_worth
    @@all << self
  end

  def name
    @name
  end

  def total_worth
    @total_worth
  end

  def self.all
    @@all
  end

  def self.tres_commas_club
    Venture_capitalist.all.select |venture_capital|
      if venture_capital.total_worth > 1000000000
        venture_capital.name 
      end
    end

  end

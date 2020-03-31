require './lib/apartment.rb'
require './lib/renter.rb'

class Building
  attr_reader :units, :renters
  def initialize
    @units = []
    @renters = []
  end

  def add_unit(apartment)
    @units << apartment
  end

  def renters
      @renters = @units.map do |unit|
        if !unit.renter.nil?
          unit.renter.name
        end
      end
      @renters.compact
      # removes nil values
  end

  
end

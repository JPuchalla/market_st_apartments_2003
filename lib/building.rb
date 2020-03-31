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

  def average_rent
    average_rent_of_units = []
    @units.each do
      |unit| average_rent_of_units << unit.monthly_rent.to_f
    end
    average_rent_of_units.sum / @units.length
  end

  def rented_units
   @units.select do
     |unit| !unit.renter.nil?
     # require "pry"; binding.pry
   end
  end



end

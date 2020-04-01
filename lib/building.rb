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

  def renter_with_highest_rent
    highest_unit = rented_units.max_by do |unit|
      unit.monthly_rent
    end
    highest_unit.renter
  end

  def units_by_number_of_bedrooms
   bedrooms = {}
   @units.each do |unit|
     if bedrooms.keys.include?(unit.bedrooms)
       bedrooms[unit.bedrooms] << unit.number
       # require "pry"; binding.pry
     else
     bedrooms[unit.bedrooms] = [unit.number]
     # require "pry"; binding.pry
     end
   end
   bedrooms
  end

  def annual_breakdown
  breakdown = {}
  rented_units.each do |unit|
    # require "pry"; binding.pry
    breakdown[unit.renter.name] = unit.monthly_rent * 12
    end
  breakdown
  end

  def rooms_by_renter
    renter.group_by do |rentee|
      # require "pry"; binding.pry

    end
  end
end

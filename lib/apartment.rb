require './lib/renter'

class Apartment
attr_reader :number, :monthly_rent, :bathrooms, :bedrooms, :renter
  def initialize(unit)
    @unit = unit
    @number = unit[:number]
    @monthly_rent = unit[:monthly_rent]
    @bathrooms = unit[:bathrooms]
    @bedrooms = unit[:bedrooms]
    @renter = nil
  end

  def add_renter(rentee)
    @renter = rentee
  end

end

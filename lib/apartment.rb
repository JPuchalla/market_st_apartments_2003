class Apartment

  def initialize(unit)
    @unit = unit
  end


  def number
    @unit[:number]
  end

  def monthly_rent
    @unit[:monthly_rent]
  end

  def bathrooms
    @unit[:bathrooms]
  end

  def bedrooms
    @unit[:bedrooms]
  end
end

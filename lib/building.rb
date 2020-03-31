class Building
  attr_reader :units
  def initialize
    @units = []
    @renters = []
  end

  def add_unit(apartment)
    @units << apartment
  end
end

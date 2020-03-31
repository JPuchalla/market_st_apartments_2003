require 'minitest/autorun'
require 'minitest/pride'
require './lib/apartment'

class RenterTest < Minitest::Test

  def setup
    @unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
  end

  def test_it_exists
    assert_instance_of Apartment, @unit1
  end

  def test_for_attributes
    assert_equal "A1",  @unit1.number
    assert_equal 1200, @unit1.monthly_rent
    assert_equal 1, @unit1.bathrooms
    assert_equal 1, @unit1.bedrooms

  end
end

require 'test_helper'

class ApartmentTest < ActiveSupport::TestCase
  def setup
    @apartment = apartments(:one)
  end

  test "should be valid" do
    assert @apartment.valid?
  end

  test "name should be present" do
    @apartment.name = nil
    assert_not @apartment.valid?
  end

  test "rent should be present" do
    @apartment.rent = nil
    assert_not @apartment.valid?
  end

  test "address should be present" do
    @apartment.address = nil
    assert_not @apartment.valid?
  end

  test "building_age should be present" do
    @apartment.building_age = nil
    assert_not @apartment.valid?
  end

  test "rent should be greater than or equal to 0" do
    @apartment.rent = -1
    assert_not @apartment.valid?
  end

  test "rent should be integer" do
    @apartment.rent = 10000.111
    assert_not @apartment.valid?
  end
end

require 'test_helper'

class NearestStationTest < ActiveSupport::TestCase
  def setup
    @nearest_station = nearest_stations(:one)
  end

  test "should be valid" do
    assert @nearest_station.valid?
  end

  test "minutes_walk should be greater than or equal to 0" do
    @nearest_station.minutes_walk = -1
    assert_not @nearest_station.valid?
  end

  test "minutes_walk should be integer" do
    @nearest_station.minutes_walk = 5.5
    assert_not @nearest_station.valid?
  end
end

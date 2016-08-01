class Apartment < ApplicationRecord
  has_many :nearest_stations, dependent: :destroy

  accepts_nested_attributes_for :nearest_stations

  NEAREST_STATIONS_COUNT = 2
end

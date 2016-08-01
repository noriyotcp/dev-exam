class Apartment < ApplicationRecord
  has_many :nearest_stations, dependent: :destroy

  accepts_nested_attributes_for :nearest_stations

  validates :name, :rent, :address, :building_age, presence: true
  validates_numericality_of :rent, :building_age, greater_than_or_equal_to: 0, only_integer: true

  NEAREST_STATIONS_COUNT = 2
end

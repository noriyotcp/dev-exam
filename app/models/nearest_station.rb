class NearestStation < ApplicationRecord
  belongs_to :apartment, optional: true

  validates_numericality_of :minutes_walk, greater_than_or_equal_to: 0, only_integer: true, allow_nil: true
end

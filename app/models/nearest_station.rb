class NearestStation < ApplicationRecord
  belongs_to :apartment, optional: true
end

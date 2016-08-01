json.extract! apartment, :id, :name, :rent, :address, :building_age, :note, :created_at, :updated_at
json.url apartment_url(apartment, format: :json)
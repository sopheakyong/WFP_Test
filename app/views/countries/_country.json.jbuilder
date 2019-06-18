json.extract! country, :id, :name,location,description, :created_at, :updated_at
json.url country_url(country, format: :json)

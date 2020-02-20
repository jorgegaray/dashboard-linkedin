json.extract! person, :id, :name, :linkedIn_id, :last_name, :born_date, :phone, :url, :created_at, :updated_at
json.url person_url(person, format: :json)

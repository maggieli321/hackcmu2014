json.array!(@foods) do |food|
  json.extract! food, :id, :name, :shelf_life
  json.url food_url(food, format: :json)
end

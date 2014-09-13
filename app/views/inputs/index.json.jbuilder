json.array!(@inputs) do |input|
  json.extract! input, :id, :food_id, :user_id, :date, :name, :quality, :exp_date, :num_days
  json.url input_url(input, format: :json)
end

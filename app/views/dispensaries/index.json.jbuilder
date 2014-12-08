json.array!(@dispensaries) do |dispensary|
  json.extract! dispensary, :id, :name, :city, :state
  json.url dispensary_url(dispensary, format: :json)
end

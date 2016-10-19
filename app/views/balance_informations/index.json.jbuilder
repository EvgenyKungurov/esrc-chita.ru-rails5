json.array!(@balance_informations) do |balance_information|
  json.extract! balance_information, :id, :title, :content
  json.url balance_information_url(balance_information, format: :json)
end

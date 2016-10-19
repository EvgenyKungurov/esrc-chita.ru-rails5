json.array!(@size_pays) do |size_pay|
  json.extract! size_pay, :id
  json.url size_pay_url(size_pay, format: :json)
end

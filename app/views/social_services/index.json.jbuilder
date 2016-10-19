json.array!(@social_services) do |social_service|
  json.extract! social_service, :id
  json.url social_service_url(social_service, format: :json)
end

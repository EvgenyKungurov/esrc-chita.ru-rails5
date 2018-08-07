json.array!(@payment_infos) do |payment_info|
  json.extract! payment_info, :id, :title, :text
  json.url payment_info_url(payment_info, format: :json)
end

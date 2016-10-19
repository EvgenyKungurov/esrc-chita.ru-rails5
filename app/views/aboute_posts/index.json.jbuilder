json.array!(@aboute_posts) do |aboute_post|
  json.extract! aboute_post, :id, :title, :text, :aboute_id
  json.url aboute_post_url(aboute_post, format: :json)
end

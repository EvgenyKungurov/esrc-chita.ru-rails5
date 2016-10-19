json.array!(@social_posts) do |social_post|
  json.extract! social_post, :id, :title, :text, :social_id
  json.url social_post_url(social_post, format: :json)
end

class SocialPost < ActiveRecord::Base
  belongs_to :social_service
  validates :title, :text, presence: true
end

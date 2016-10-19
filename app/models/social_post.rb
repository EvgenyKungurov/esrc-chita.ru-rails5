class SocialPost < ActiveRecord::Base
  belongs_to :social_service
  validates :title, presence: true
  validates :text, presence: true
end

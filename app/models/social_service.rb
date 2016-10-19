class SocialService < ActiveRecord::Base
  has_many :social_posts, dependent: :destroy
  accepts_nested_attributes_for :social_posts, :allow_destroy => true
  validates :name, presence: true
end

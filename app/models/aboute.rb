class Aboute < ActiveRecord::Base
  has_many :aboute_posts, dependent: :destroy
  validates :text, presence: true
end

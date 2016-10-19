class AboutePost < ActiveRecord::Base
  belongs_to :aboute
  validates :title, presence: true
  validates :text, presence: true
end

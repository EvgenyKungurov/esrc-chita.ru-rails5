class AboutePost < ActiveRecord::Base
  belongs_to :aboute
  validates :title, :text, presence: true
end

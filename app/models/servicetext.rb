class Servicetext < ActiveRecord::Base
  belongs_to :services
  validates :title, :text, :service_id, presence: true
end

class Service < ActiveRecord::Base
	validates :title, presence: true,
                    length: { minimum: 5 }
  has_many :servicetexts
end

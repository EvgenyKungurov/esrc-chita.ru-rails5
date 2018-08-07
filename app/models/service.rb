class Service < ActiveRecord::Base
  validates :title, presence: true, length: { minimum: 5 }
  validates :type_service, presence: true
  has_many :servicetexts, dependent: :destroy

  def type_service
    %w(ДСВ МСП)
  end
end

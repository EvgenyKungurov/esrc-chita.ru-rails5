class User < ActiveRecord::Base
  has_many :answerposts
  before_save { self.email = email.downcase }
  before_create :create_remember_token
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX, message: "имеет не допустимый формат" },
                    uniqueness: { case_sensitive: false, message: "уже существует" }
  has_secure_password
  validates :password, length: { message: "/ Пароль должен быть не менее 6 символов", minimum: 6 }
  validates :password_confirmation, length: { message: "/ пароль и повторный пароль не совпадает", minimum: 6 }

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

private
  def create_remember_token
    self.remember_token = User.encrypt(User.new_remember_token)
  end
end

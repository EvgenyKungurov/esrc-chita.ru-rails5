module SessionsHelper
  def sign_in(user)
    remember_token = User.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.encrypt(remember_token))
    self.current_user = user
  end

  def sign_in?
    current_user
  end

  def sign_in_admin?
    current_user && current_user.role && current_user.role == 'administrator'
  end

  def sign_in_respondent?
    current_user && current_user.role && current_user.role.split(',').include?('respondent')
  end

  def sign_in_editor?
    current_user && current_user.role && current_user.role.split(',').include?('editor')
  end

  def sign_out
    current_user.update_attribute(:remember_token, User.encrypt(User.new_remember_token))
    cookies.delete(:remember_token)
    self.current_user = nil
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    remember_token = User.encrypt(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
  end

  def current_user?(user)
    user == current_user
  end
end

module SessionsHelper
  def can_do_it?
    redirect_to root_path unless authenticate_user! && (current_user.has_role? :admin || :editor)
  end
end

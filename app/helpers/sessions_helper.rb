module SessionsHelper
  def sign_in(user)
    remember_token = User.new_remember_token
    cookies.permanent[:remember_token] = remember_token

    # use update_attribute to bypass validations b/c we don't have the password
    # confirmation.
    user.update_attribute(:remember_token, User.digest(remember_token))
    # Set the current user in case use sign_in without a subsequent redirect
    self.current_user = user
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    hashed_remember_token = User.digest(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: hashed_remember_token)
  end
end

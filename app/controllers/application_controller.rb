class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  def authenticate_user!
    return true
  end
end

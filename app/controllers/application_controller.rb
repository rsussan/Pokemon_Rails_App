class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protected

  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to user_session_path, :notice => 'You must login to continue!'
    end
  end

  def after_sign_in_path_for(resource)
    trainers_index_path # Or :prefix_to_your_route
  end
  def after_sign_up_path_for(resource)
    redirect_to root_path # Or :prefix_to_your_route
  end

end

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    return @current_user if defined?(@current_user)

    @current_user = begin
      user_id = session[:user_id]

      if user_id
        User.find_by(id: user_id)
      end
    end
  end

  def append_info_to_payload(payload)
    super

    payload[:user_id] = current_user.id if current_user.present?
  end
end

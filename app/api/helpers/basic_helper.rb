require 'devise/controllers/sign_in_out'
module BasicHelper

  include Devise::Controllers::SignInOut

  def session
    env['rack.session']
  end

  def general_error(message, status=400)
    error!({error_description: message}, status)
  end

  def authenticate!
    general_error('401 Unauthorized', 401) if current_user_id==0
    # error!('401 Unauthorized', 401) unless current_user
  end

  def warden
    env['warden']
  end

  def current_user
    env['warden'].user
  end

  def current_user_id
    id = 0
    id = current_user.id if current_user.present?
    id
  end

  # 是否是本地用户
  def local_user?
    current_user.present?
  end
end
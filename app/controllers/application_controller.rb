class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do
    # flash[:alert] = exception.message
    render 'admin/base/access_denied'
    # redirect_to admin_access_denied_path, alert: exception.message
  end

  # 错误处理 - 全局
  rescue_from Exception do |e|

    if e.instance_of? CanCan::AccessDenied
      flash[:alert] = e.message
      render 'admin/base/access_denied', layout: false
    else
      begin
        Debug.create(message: e.message, backtrace: e.backtrace, ip: request.ip, user_id: current_user.id, source: request.user_agent)
        GeneralLog.write :error, "#{e.message}\n#{e.backtrace}"
      rescue => ex
        GeneralLog.write :error, "#{ex.message}\n#{ex.backtrace}"
      end
      if request.xhr?
        render json: {status: :error, msg: e.message, trace: e.backtrace}, status: 500
      else
        raise e
      end
    end
  end

  def add_breadcrumb(title, src = request.path)
    @breadcrumbs ||= []

    @breadcrumbs << {title: title, src: src}
  end

  def guide
    return render nothing: true if Rails.env != 'development'
    add_breadcrumb '样式', ''
    render 'shared/guide'
  end

  protected

  def create_success_notice(model_name)
    "#{t ('activerecord.models.'<< model_name.to_s)}#{t 'common.create'}#{t 'common.success'}。"
  end

  def update_success_notice(model_name)
    "#{t ('activerecord.models.'<< model_name.to_s)}#{t 'common.update'}#{t 'common.success'}。"
  end

  def destroy_success_notice(model_name)
    "#{t ('activerecord.models.'<< model_name.to_s)}#{t 'common.destroy'}#{t 'common.success'}。"
  end

  def enabled_notice(model_name)
    "#{t ('activerecord.models.'<< model_name.to_s)}#{t 'common.enabled_not'}。"
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:phone, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :phone, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:phone, :email, :password, :password_confirmation, :current_password) }
  end
end

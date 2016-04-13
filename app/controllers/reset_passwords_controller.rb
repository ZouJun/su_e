# coding: UTF-8
class ResetPasswordsController < ApplicationController
  # GET /reset_passwords
  layout :false
  def index
    add_breadcrumb t('common.list'), request.path
    @reset_passwords = initialize_grid(ResetPassword, page: params[:page], order: :created_at, order_direction: :desc)
    @reset_password = ResetPassword.new(reset_password_params)
    reset_password(@reset_password)
  end

  # GET /reset_passwords/1
  def show
  end




  private
  # 获取实体对象
  def set_reset_password
     @reset_password = ResetPassword.find(params[:id])
  end

  # 是否可以编辑或者删除
  def edit_check
    # if(@reset_password.enabled_at.present?)
    #   redirect_to reset_password_path(@reset_password.id), notice: enabled_notice(:reset_password)
    #   return
    # end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def reset_password_params
     params.require(:reset_password).permit(:email)
  end

  def base_breadcrumb
    add_breadcrumb (t 'activerecord.attributes.reset_password.admin_title'), reset_passwords_path
  end

  def name_breadcrumb
    add_breadcrumb  @reset_password.name, reset_password_path(@reset_password.id)
  end
end
# coding: UTF-8
class Admin::UsersController < Admin::ApplicationController
  load_resource
  authorize_resource
  before_filter :set_user, only: [:show, :edit, :update, :destroy]
  before_filter :base_breadcrumb
  before_filter :name_breadcrumb, only: [:show, :edit]

  # GET /admin/users
  def index
    add_breadcrumb t('common.list'), request.path
    respond_to do |format|
      format.html {
        @users = initialize_grid(User, page: params[:page], order: :created_at, order_direction: :desc) }
      format.json {
        @users = User.all.page(params[:page]).per(50)
        if params[:q].present?
          @users = @users.where('account LIKE :q OR name LIKE :q OR phone LIKE :q OR email LIKE :q', q: "%#{params[:q]}%")
          render 'index_select2'
        end
      }
    end
  end

  # GET /admin/users/1
  def show
  end

  # GET /admin/users/new
  def new
    add_breadcrumb t('common.create'), request.path
    @user = User.new
  end

  # GET /admin/users/1/edit
  def edit
    add_breadcrumb t('common.edit'), request.path
  end

  # POST /admin/users
  def create
    @user = User.new(user_params)
    @user.roles = params[:user][:roles].map do |role|
      Role.find(role)
    end

    respond_to do |format|
      if @user.save
        format.html { redirect_to admin_user_path(@user.id), notice: create_success_notice(:user) }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/users/1
  def update
    params[:user].delete :password if params[:user][:password].blank?

    respond_to do |format|
      # 设置用户的角色
      if params[:user][:roles].present? and params[:user][:roles].length >0
        @user.roles = params[:user][:roles].map do |role|
          Role.find(role)
        end
      else
        @user.roles = []
      end
      if @user.update_attributes(user_params)
       format.html { redirect_to admin_user_path(@user.id), notice: update_success_notice(:user) }
        format.json { head :no_content }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/users/1
  def destroy
    begin
      @user.destroy
    rescue => e
      @user.update_attributes(enable: false)
    end

    respond_to do |format|
      format.html { redirect_to admin_users_path, notice: destroy_success_notice(:user) }
      format.json { head :no_content }
    end
  end

  def destroy_multi
    ids =params[:grid][:select_ids]
    if ids and ids.instance_of? Array
      ids.each do |id|
        user = User.find(id)
        begin
          user.destroy! if user
        rescue ActiveRecord::RecordNotDestroyed
          user.update_attributes(enable: false)
          next
        end
      end
    end
  rescue
    flash[:notice] ="#{t 'common.delete_multi'}#{t 'common.fault'}"
    redirect_to action: 'index'
  else
    flash[:notice] ="#{t 'common.delete_multi'}#{t 'common.success'}"
    redirect_to action: 'index'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    if params[:action] == 'show'
      @user = User.find(params[:id])
    else
      @user = User.find(params[:id])
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:name, :phone, :email, :password, :identification, :sex, :remark)
  end

  def base_breadcrumb
    add_breadcrumb (t 'activerecord.attributes.user.admin_title'), admin_users_path
  end

  def name_breadcrumb
    add_breadcrumb @user.name, admin_user_path(@user.id)
  end
end
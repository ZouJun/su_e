# coding: UTF-8
class Admin::RolesController < Admin::ApplicationController
  load_resource
  authorize_resource
  before_filter :set_role, only: [:show, :edit, :update, :destroy]
  before_filter :base_breadcrumb
  before_filter :name_breadcrumb, only: [:show, :edit]

  # GET /admin/roles
  def index
    add_breadcrumb t('common.list'), request.path
    @roles = initialize_grid(Role, page: params[:page], order: :created_at, order_direction: :desc)
  end

  # GET /admin/roles/1
  def show
  end

  # GET /admin/roles/new
  def new
    add_breadcrumb t('common.create'), request.path
    @role = Role.new
  end

  # GET /admin/roles/1/edit
  def edit
    add_breadcrumb t('common.edit'), request.path
  end

  # POST /admin/roles
  def create
    @role = Role.new(role_params)

    permissions = params[:role][:permissions].map do |permission_id|
      Permission.find(permission_id)
    end

    @role.permissions = permissions

    respond_to do |format|
      if @role.save
        format.html { redirect_to admin_role_path(@role.id), notice: create_success_notice(:role) }
        format.json { render :show, status: :created, location: @role }
      else
        format.html { render :new }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/roles/1
  def update
    permissions = params[:role][:permissions].map do |permission_id|
      Permission.find(permission_id)
    end

    @role.permissions = permissions

    respond_to do |format|
      if @role.update_attributes(role_params)
        format.html { redirect_to admin_role_path(@role.id), notice: update_success_notice(:role) }
        format.json { head :no_content }
      else
        format.html { render :edit }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/roles/1
  def destroy
    begin
      @role.destroy
    rescue
      @role.update_attributes(enable: false)
    end

    respond_to do |format|
      format.html { redirect_to admin_roles_path, notice: destroy_success_notice(:role) }
      format.json { head :no_content }
    end
  end

  def destroy_multi
    ids =params[:grid][:select_ids]
    if ids and ids.instance_of? Array
      ids.each do |id|
        role = Role.find(id)
        begin
          role.destroy! if role
        rescue ActiveRecord::RecordNotDestroyed
          role.update_attributes(enable: false)
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
  def set_role
    if params[:action] == 'show'
      @role = Role.find(params[:id])
    else
      @role = Role.find(params[:id])
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def role_params
    params.require(:role).permit(:name, :position, :permissions);
  end

  def base_breadcrumb
    add_breadcrumb ("#{t 'activerecord.attributes.role.admin_title'}"), admin_roles_path
  end

  def name_breadcrumb
    add_breadcrumb @role.name, admin_role_path(@role.id)
  end
end
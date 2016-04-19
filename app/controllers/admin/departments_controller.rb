# coding: UTF-8
class Admin::DepartmentsController < Admin::ApplicationController
  load_resource
  authorize_resource
  #before_filter :set_department, only: [:show, :edit, :update, :destroy]
  before_filter :edit_check, only: [:edit, :update, :destroy]
  before_filter :base_breadcrumb
  before_filter :name_breadcrumb, only: [:show, :edit]

  # GET /admin/departments
  def index
    add_breadcrumb t('common.list'), request.path
    @departments = initialize_grid(Department, page: params[:page], order: :created_at, order_direction: :desc)
  end

  # GET /admin/departments/1
  def show
  end

  # GET /admin/departments/new
  def new
    add_breadcrumb t('common.create'), request.path
  end

  # GET /admin/departments/1/edit
  def edit
    add_breadcrumb t('common.edit'), request.path
  end

  # POST /admin/departments
  def create
    @department = Department.new(department_params)

    respond_to do |format|
      if @department.save
        @department.user = User.create! name: @department.d_name, password: @department.d_password
        format.html {
          if(!params[:submit_continue].nil?)
            # 表示继续
            redirect_to new_admin_department_path(), notice: create_success_notice(:department)
        else
            redirect_to admin_department_path(@department.id), notice: create_success_notice(:department)
         end
       }
       format.json { render :show, status: :created, location: @department }
      else
        format.html { render :new }
        format.json { render json: @department.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/departments/1
  def update
    respond_to do |format|
      if @department.update_attributes(department_params)
         format.html {
           if(!params[:submit_continue].nil?)
             # 表示继续
             redirect_to new_admin_department_path(), notice: update_success_notice(:survey_form)
         else
           redirect_to admin_department_path(@department.id), notice: update_success_notice(:department)
           end
         }
        format.json { head :no_content }
     else
        format.html { render :edit }
        format.json { render json: @department.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /admin/departments/1
  def destroy
    
    @department.destroy
    

    respond_to do |format|
      format.html { redirect_to admin_departments_path, notice: destroy_success_notice(:department) }
      format.json { head :no_content }
    end
  end

  def destroy_multi
    ids =params[:grid][:select_ids]
    
      Department.delete_all(id: ids)
    

  rescue
    flash[:notice] ="#{t 'common.delete_multi'}#{t 'common.fault'}"
    redirect_to action: 'index'
  else
    flash[:notice] ="#{t 'common.delete_multi'}#{t 'common.success'}"
    redirect_to action: 'index'
  end

  private
  # 获取实体对象
  def set_department
     @department = Department.find(params[:id])
  end

  # 是否可以编辑或者删除
  def edit_check
    # if(@department.enabled_at.present?)
    #   redirect_to admin_department_path(@department.id), notice: enabled_notice(:department)
    #   return
    # end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def department_params
    params.require(:department).permit(:d_number, :d_name, :d_password, :academy, :major, :age, :sex, :email, :address, :telephone, :d_power)
  end

  def base_breadcrumb
    add_breadcrumb (t 'activerecord.attributes.department.admin_title'), admin_departments_path
  end

  def name_breadcrumb
    add_breadcrumb  @department.d_name, admin_department_path(@department.id)
  end
end
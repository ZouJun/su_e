# coding: UTF-8
class Admin::TeachersController < Admin::ApplicationController
  load_resource
  authorize_resource
  #before_filter :set_teacher, only: [:show, :edit, :update, :destroy]
  before_filter :edit_check, only: [:edit, :update, :destroy]
  before_filter :base_breadcrumb
  before_filter :name_breadcrumb, only: [:show, :edit]

  # GET /admin/teachers
  def index
    add_breadcrumb t('common.list'), request.path
    @teachers = initialize_grid(Teacher, page: params[:page], order: :created_at, order_direction: :desc)
  end

  # GET /admin/teachers/1
  def show
  end

  # GET /admin/teachers/new
  def new
    add_breadcrumb t('common.create'), request.path
  end

  # GET /admin/teachers/1/edit
  def edit
    add_breadcrumb t('common.edit'), request.path
  end

  # POST /admin/teachers
  def create
    @teacher = Teacher.new(teacher_params)

    respond_to do |format|
      if @teacher.save
        format.html {
          if(!params[:submit_continue].nil?)
            # 表示继续
            redirect_to new_admin_teacher_path(), notice: create_success_notice(:teacher)
        else
            redirect_to admin_teacher_path(@teacher.id), notice: create_success_notice(:teacher)
         end
       }
       format.json { render :show, status: :created, location: @teacher }
      else
        format.html { render :new }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/teachers/1
  def update
    respond_to do |format|
      if @teacher.update_attributes(teacher_params)
         format.html {
           if(!params[:submit_continue].nil?)
             # 表示继续
             redirect_to new_admin_teacher_path(), notice: update_success_notice(:survey_form)
         else
           redirect_to admin_teacher_path(@teacher.id), notice: update_success_notice(:teacher)
           end
         }
        format.json { head :no_content }
     else
        format.html { render :edit }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /admin/teachers/1
  def destroy
    
    @teacher.destroy
    

    respond_to do |format|
      format.html { redirect_to admin_teachers_path, notice: destroy_success_notice(:teacher) }
      format.json { head :no_content }
    end
  end

  def destroy_multi
    ids =params[:grid][:select_ids]
    
      Teacher.delete_all(id: ids)
    

  rescue
    flash[:notice] ="#{t 'common.delete_multi'}#{t 'common.fault'}"
    redirect_to action: 'index'
  else
    flash[:notice] ="#{t 'common.delete_multi'}#{t 'common.success'}"
    redirect_to action: 'index'
  end

  private
  # 获取实体对象
  def set_teacher
     @teacher = Teacher.find(params[:id])
  end

  # 是否可以编辑或者删除
  def edit_check
    # if(@teacher.enabled_at.present?)
    #   redirect_to admin_teacher_path(@teacher.id), notice: enabled_notice(:teacher)
    #   return
    # end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def teacher_params
    params.require(:teacher).permit(:t_number, :t_name, :t_password, :academy, :major, :age, :sex, :email, :address, :telephone, :t_power, :ip)
  end

  def base_breadcrumb
    add_breadcrumb (t 'activerecord.attributes.teacher.admin_title'), admin_teachers_path
  end

  def name_breadcrumb
    add_breadcrumb  @teacher.t_name, admin_teacher_path(@teacher.id)
  end
end
# coding: UTF-8
class Admin::StudentsController < Admin::ApplicationController
  load_resource
  authorize_resource
  # skip_load_and_authorize_resource :only => [:new, :create]
  #before_filter :set_student, only: [:show, :edit, :update, :destroy]
  # skip_authorization_check :only => [:new, :create]
  before_filter :edit_check, only: [:edit, :update, :destroy]
  before_filter :base_breadcrumb
  before_filter :name_breadcrumb, only: [:show, :edit]

  def import
    Student.import(params[:file])
    respond_to do |format|
        format.html { redirect_to admin_students_path, notice: create_success_notice(:student) }
        format.json { render :show, status: :created, location: @student }
    end
  end

  # GET /admin/students
  def index
    add_breadcrumb t('common.list'), request.path
    @students = initialize_grid(Student, page: params[:page], order: :created_at, order_direction: :desc)
  end

  # GET /admin/students/1
  def show
  end

  # GET /admin/students/new
  def new
    add_breadcrumb t('common.create'), request.path
  end

  # GET /admin/students/1/edit
  def edit
    add_breadcrumb t('common.edit'), request.path
  end

  # POST /admin/students
  def create
    @student = Student.new(student_params)
    # authorize! :create, @student
    respond_to do |format|
      if @student.save
        @student.user = User.create! name: @student.s_name, password: @student.s_password
        format.html {
          if(!params[:submit_continue].nil?)
            # 表示继续
            redirect_to admin_students_path, notice: create_success_notice(:student)
        else
            redirect_to admin_student_path(@student.id), notice: create_success_notice(:student)
         end
       }
       format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/students/1
  def update

    # respond_to do |format|
    #   if @student.update_attributes(student_params)
    #      format.html {
    #        if(!params[:submit_continue].nil?)
    #          # 表示继续
    #          redirect_to new_admin_student_path(), notice: update_success_notice(:survey_form)
    #      else
    #        redirect_to admin_student_path(@student.id), notice: update_success_notice(:student)
    #        end
    #      }
    #     format.json { head :no_content }
    #  else
    #     format.html { render :edit }
    #     format.json { render json: @student.errors, status: :unprocessable_entity }
    #   end
    # end
  end


  # DELETE /admin/students/1
  def destroy
    
    @student.destroy
    

    respond_to do |format|
      format.html { redirect_to admin_students_path, notice: destroy_success_notice(:student) }
      format.json { head :no_content }
    end
  end

  def destroy_multi
    ids =params[:grid][:select_ids]
    
      Student.delete_all(id: ids)
    

  rescue
    flash[:notice] ="#{t 'common.delete_multi'}#{t 'common.fault'}"
    redirect_to action: 'index'
  else
    flash[:notice] ="#{t 'common.delete_multi'}#{t 'common.success'}"
    redirect_to action: 'index'
  end

  private
  # 获取实体对象
  def set_student
     @student = Student.find(params[:id])
  end

  # 是否可以编辑或者删除
  def edit_check
    # if(@student.enabled_at.present?)
    #   redirect_to admin_student_path(@student.id), notice: enabled_notice(:student)
    #   return
    # end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def student_params
    params.require(:student).permit(:s_number, :s_name, :s_password, :academy, :major, :age, :sex, :email, :address, :telephone, :s_power, :info_file)
  end

  def base_breadcrumb
    add_breadcrumb (t 'activerecord.attributes.student.admin_title'), admin_students_path
  end

  def name_breadcrumb
    add_breadcrumb  @student.s_name, admin_student_path(@student.id)
  end
end
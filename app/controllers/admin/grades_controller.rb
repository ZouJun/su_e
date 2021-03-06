# coding: UTF-8
class Admin::GradesController < Admin::ApplicationController
  load_resource
  authorize_resource
  #before_filter :set_grade, only: [:show, :edit, :update, :destroy]
  before_filter :edit_check, only: [:edit, :update, :destroy]
  before_filter :base_breadcrumb
  before_filter :name_breadcrumb, only: [:show, :edit]

  # GET /admin/grades
  def index
    add_breadcrumb t('common.list'), request.path
    @grades = initialize_grid(Grade, page: params[:page], order: :created_at, order_direction: :desc)
  end

  # GET /admin/grades/1
  def show
  end

  # GET /admin/grades/new
  def new
    add_breadcrumb t('common.create'), request.path
  end

  # GET /admin/grades/1/edit
  def edit
    add_breadcrumb t('common.edit'), request.path
  end

  # POST /admin/grades
  def create
    @grade = Grade.new(grade_params)

    respond_to do |format|
      if @grade.save
        format.html {
          if(!params[:submit_continue].nil?)
            # 表示继续
            redirect_to new_admin_grade_path(), notice: create_success_notice(:grade)
        else
            redirect_to admin_grade_path(@grade.id), notice: create_success_notice(:grade)
         end
       }
       format.json { render :show, status: :created, location: @grade }
      else
        format.html { render :new }
        format.json { render json: @grade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/grades/1
  def update
    respond_to do |format|
      if @grade.update_attributes(grade_params)
         format.html {
           if(!params[:submit_continue].nil?)
             # 表示继续
             redirect_to new_admin_grade_path(), notice: update_success_notice(:survey_form)
         else
           redirect_to admin_grade_path(@grade.id), notice: update_success_notice(:grade)
           end
         }
        format.json { head :no_content }
     else
        format.html { render :edit }
        format.json { render json: @grade.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /admin/grades/1
  def destroy
    
    @grade.destroy
    

    respond_to do |format|
      format.html { redirect_to admin_grades_path, notice: destroy_success_notice(:grade) }
      format.json { head :no_content }
    end
  end

  def destroy_multi
    ids =params[:grid][:select_ids]
    
      Grade.delete_all(id: ids)
    

  rescue
    flash[:notice] ="#{t 'common.delete_multi'}#{t 'common.fault'}"
    redirect_to action: 'index'
  else
    flash[:notice] ="#{t 'common.delete_multi'}#{t 'common.success'}"
    redirect_to action: 'index'
  end

  private
  # 获取实体对象
  def set_grade
     @grade = Grade.find(params[:id])
  end

  # 是否可以编辑或者删除
  def edit_check
    # if(@grade.enabled_at.present?)
    #   redirect_to admin_grade_path(@grade.id), notice: enabled_notice(:grade)
    #   return
    # end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def grade_params
    params.require(:grade).permit(:score, :verify)
  end

  def base_breadcrumb
    add_breadcrumb (t 'activerecord.attributes.grade.admin_title'), admin_grades_path
  end

  def name_breadcrumb
    add_breadcrumb  @grade.score, admin_grade_path(@grade.id)
  end
end
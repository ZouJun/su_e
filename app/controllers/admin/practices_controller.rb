# coding: UTF-8
class Admin::PracticesController < Admin::ApplicationController
  load_resource
  authorize_resource
  #before_filter :set_practice, only: [:show, :edit, :update, :destroy]
  before_filter :edit_check, only: [:edit, :update, :destroy]
  before_filter :base_breadcrumb
  before_filter :name_breadcrumb, only: [:show, :edit]

  # GET /admin/practices
  def index
    add_breadcrumb t('common.list'), request.path
    @practices = initialize_grid(Practice, page: params[:page], order: :created_at, order_direction: :desc)
  end

  # GET /admin/practices/1
  def show
  end

  # GET /admin/practices/new
  def new
    add_breadcrumb t('common.create'), request.path
  end

  # GET /admin/practices/1/edit
  def edit
    add_breadcrumb t('common.edit'), request.path
  end

  # POST /admin/practices
  def create
    @practice = Practice.new(practice_params)

    respond_to do |format|
      if @practice.save
        format.html {
          if(!params[:submit_continue].nil?)
            # 表示继续
            redirect_to new_admin_practice_path(), notice: create_success_notice(:practice)
        else
            redirect_to admin_practice_path(@practice.id), notice: create_success_notice(:practice)
         end
       }
       format.json { render :show, status: :created, location: @practice }
      else
        format.html { render :new }
        format.json { render json: @practice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/practices/1
  def update
    respond_to do |format|
      if @practice.update_attributes(practice_params)
         format.html {
           if(!params[:submit_continue].nil?)
             # 表示继续
             redirect_to new_admin_practice_path(), notice: update_success_notice(:survey_form)
         else
           redirect_to admin_practice_path(@practice.id), notice: update_success_notice(:practice)
           end
         }
        format.json { head :no_content }
     else
        format.html { render :edit }
        format.json { render json: @practice.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /admin/practices/1
  def destroy
    
    @practice.destroy
    

    respond_to do |format|
      format.html { redirect_to admin_practices_path, notice: destroy_success_notice(:practice) }
      format.json { head :no_content }
    end
  end

  def destroy_multi
    ids =params[:grid][:select_ids]
    
      Practice.delete_all(id: ids)
    

  rescue
    flash[:notice] ="#{t 'common.delete_multi'}#{t 'common.fault'}"
    redirect_to action: 'index'
  else
    flash[:notice] ="#{t 'common.delete_multi'}#{t 'common.success'}"
    redirect_to action: 'index'
  end

  private
  # 获取实体对象
  def set_practice
     @practice = Practice.find(params[:id])
  end

  # 是否可以编辑或者删除
  def edit_check
    # if(@practice.enabled_at.present?)
    #   redirect_to admin_practice_path(@practice.id), notice: enabled_notice(:practice)
    #   return
    # end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def practice_params
    params.require(:practice).permit(:p_name, :post, :address, :telephone, :memento)
  end

  def base_breadcrumb
    add_breadcrumb (t 'activerecord.attributes.practice.admin_title'), admin_practices_path
  end

  def name_breadcrumb
    add_breadcrumb  @practice.name, admin_practice_path(@practice.id)
  end
end
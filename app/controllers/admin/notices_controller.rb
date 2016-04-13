# coding: UTF-8
class Admin::NoticesController < Admin::ApplicationController
  load_resource
  authorize_resource
  #before_filter :set_notice, only: [:show, :edit, :update, :destroy]
  before_filter :edit_check, only: [:edit, :update, :destroy]
  before_filter :base_breadcrumb
  before_filter :name_breadcrumb, only: [:show, :edit]

  # GET /admin/notices
  def index
    add_breadcrumb t('common.list'), request.path
    @notices = initialize_grid(Notice, page: params[:page], order: :created_at, order_direction: :desc)
  end

  # GET /admin/notices/1
  def show
  end

  # GET /admin/notices/new
  def new
    add_breadcrumb t('common.create'), request.path
  end

  # GET /admin/notices/1/edit
  def edit
    add_breadcrumb t('common.edit'), request.path
  end

  # POST /admin/notices
  def create
    @notice = Notice.new(notice_params)
    if current_user.teacher?
      @notice.teacher_id = current_user.id
      @notice.unit = current_user.name
    elsif
      @notice.user_id = current_user.id
      @notice.unit = current_user.name
    end

    respond_to do |format|
      if @notice.save
        format.html {
          if(!params[:submit_continue].nil?)
            # 表示继续
            redirect_to new_admin_notice_path(), notice: create_success_notice(:notice)
        else
            redirect_to admin_notice_path(@notice.id), notice: create_success_notice(:notice)
         end
       }
       format.json { render :show, status: :created, location: @notice }
      else
        format.html { render :new }
        format.json { render json: @notice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/notices/1
  def update
    respond_to do |format|
      if @notice.update_attributes(notice_params)
         format.html {
           if(!params[:submit_continue].nil?)
             # 表示继续
             redirect_to new_admin_notice_path(), notice: update_success_notice(:survey_form)
         else
           redirect_to admin_notice_path(@notice.id), notice: update_success_notice(:notice)
           end
         }
        format.json { head :no_content }
     else
        format.html { render :edit }
        format.json { render json: @notice.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /admin/notices/1
  def destroy
    
    @notice.destroy
    

    respond_to do |format|
      format.html { redirect_to admin_notices_path, notice: destroy_success_notice(:notice) }
      format.json { head :no_content }
    end
  end

  def destroy_multi
    ids =params[:grid][:select_ids]
    
      Notice.delete_all(id: ids)
    

  rescue
    flash[:notice] ="#{t 'common.delete_multi'}#{t 'common.fault'}"
    redirect_to action: 'index'
  else
    flash[:notice] ="#{t 'common.delete_multi'}#{t 'common.success'}"
    redirect_to action: 'index'
  end

  private
  # 获取实体对象
  def set_notice
     @notice = Notice.find(params[:id])
  end

  # 是否可以编辑或者删除
  def edit_check
    # if(@notice.enabled_at.present?)
    #   redirect_to admin_notice_path(@notice.id), notice: enabled_notice(:notice)
    #   return
    # end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def notice_params
    params.require(:notice).permit(:n_title, :n_content, :n_type, :n_tags, :views)
  end

  def base_breadcrumb
    add_breadcrumb (t 'activerecord.attributes.notice.admin_title'), admin_notices_path
  end

  def name_breadcrumb
    add_breadcrumb  @notice.n_title, admin_notice_path(@notice.id)
  end
end
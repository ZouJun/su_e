# coding: UTF-8
class Admin::DocumentsController < Admin::ApplicationController
  load_resource
  authorize_resource
  #before_filter :set_document, only: [:show, :edit, :update, :destroy]
  before_filter :edit_check, only: [:edit, :update, :destroy]
  before_filter :base_breadcrumb
  before_filter :name_breadcrumb, only: [:show, :edit]


  def download
    @documents = Document.all

    respond_to do |format|
      format.html{render 'admin/documents/download'}

    end
  end

  # GET /admin/documents
  def index
    add_breadcrumb t('common.list'), request.path
    # @documents = initialize_grid(Document, page: params[:page], order: :created_at, order_direction: :desc)
    @documents = Document.all
  end

  # GET /admin/documents/1
  def show
  end

  # GET /admin/documents/new
  def new
    add_breadcrumb t('common.create'), request.path
  end

  # GET /admin/documents/1/edit
  def edit
    add_breadcrumb t('common.edit'), request.path
  end

  # POST /admin/documents
  def create
    @document = Document.new(document_params)
    if current_user.teacher?
      @document.teacher_id = current_user.id
    elsif current_user.student?
      @document.student_id = current_user.id
    elsif
      @document.user_id = current_user.id
    end

    respond_to do |format|
      if @document.save
        format.html {
          if(!params[:submit_continue].nil?)
            # 表示继续
            redirect_to new_admin_document_path(), notice: create_success_notice(:document)
        else
            redirect_to admin_document_path(@document.id), notice: create_success_notice(:document)
         end
       }
       format.json { render :show, status: :created, location: @document }
      else
        format.html { render :new }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/documents/1
  def update
    respond_to do |format|
      if @document.update_attributes(document_params)
         format.html {
           if(!params[:submit_continue].nil?)
             # 表示继续
             redirect_to new_admin_document_path(), notice: update_success_notice(:survey_form)
         else
           redirect_to admin_document_path(@document.id), notice: update_success_notice(:document)
           end
         }
        format.json { head :no_content }
     else
        format.html { render :edit }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /admin/documents/1
  def destroy
    
    @document.destroy
    

    respond_to do |format|
      format.html { redirect_to admin_documents_path, notice: destroy_success_notice(:document) }
      format.json { head :no_content }
    end
  end

  def destroy_multi
    ids =params[:grid][:select_ids]
    
      Document.delete_all(id: ids)
    

  rescue
    flash[:notice] ="#{t 'common.delete_multi'}#{t 'common.fault'}"
    redirect_to action: 'index'
  else
    flash[:notice] ="#{t 'common.delete_multi'}#{t 'common.success'}"
    redirect_to action: 'index'
  end

  private
  # 获取实体对象
  def set_document
     @document = Document.find(params[:id])
  end

  # 是否可以编辑或者删除
  def edit_check
    # if(@document.enabled_at.present?)
    #   redirect_to admin_document_path(@document.id), notice: enabled_notice(:document)
    #   return
    # end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def document_params
    params.require(:document).permit(:d_title, :d_content, :d_type, :d_tags, :annex)
  end

  def base_breadcrumb
    add_breadcrumb (t 'activerecord.attributes.document.admin_title'), admin_documents_path
  end

  def name_breadcrumb
    add_breadcrumb  @document.d_title, admin_document_path(@document.id)
  end
end
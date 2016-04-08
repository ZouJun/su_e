# coding: UTF-8
class Admin::MessagesController < Admin::ApplicationController
  load_resource
  authorize_resource
  #before_filter :set_message, only: [:show, :edit, :update, :destroy]
  before_filter :edit_check, only: [:edit, :update, :destroy]
  before_filter :base_breadcrumb
  before_filter :name_breadcrumb, only: [:show, :edit]

  # GET /admin/messages
  def index
    add_breadcrumb t('common.list'), request.path
    @messages = initialize_grid(Message, page: params[:page], order: :created_at, order_direction: :desc)
  end

  # GET /admin/messages/1
  def show
  end

  # GET /admin/messages/new
  def new
    add_breadcrumb t('common.create'), request.path
  end

  # GET /admin/messages/1/edit
  def edit
    add_breadcrumb t('common.edit'), request.path
  end

  # POST /admin/messages
  def create
    @message = Message.new(message_params)

    respond_to do |format|
      if @message.save
        format.html {
          if(!params[:submit_continue].nil?)
            # 表示继续
            redirect_to new_admin_message_path(), notice: create_success_notice(:message)
        else
            redirect_to admin_message_path(@message.id), notice: create_success_notice(:message)
         end
       }
       format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/messages/1
  def update
    respond_to do |format|
      if @message.update_attributes(message_params)
         format.html {
           if(!params[:submit_continue].nil?)
             # 表示继续
             redirect_to new_admin_message_path(), notice: update_success_notice(:survey_form)
         else
           redirect_to admin_message_path(@message.id), notice: update_success_notice(:message)
           end
         }
        format.json { head :no_content }
     else
        format.html { render :edit }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /admin/messages/1
  def destroy
    
    @message.destroy
    

    respond_to do |format|
      format.html { redirect_to admin_messages_path, notice: destroy_success_notice(:message) }
      format.json { head :no_content }
    end
  end

  def destroy_multi
    ids =params[:grid][:select_ids]
    
      Message.delete_all(id: ids)
    

  rescue
    flash[:notice] ="#{t 'common.delete_multi'}#{t 'common.fault'}"
    redirect_to action: 'index'
  else
    flash[:notice] ="#{t 'common.delete_multi'}#{t 'common.success'}"
    redirect_to action: 'index'
  end

  private
  # 获取实体对象
  def set_message
     @message = Message.find(params[:id])
  end

  # 是否可以编辑或者删除
  def edit_check
    # if(@message.enabled_at.present?)
    #   redirect_to admin_message_path(@message.id), notice: enabled_notice(:message)
    #   return
    # end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def message_params
    params.require(:message).permit(:m_title, :m_content, :n_type, :m_tags)
  end

  def base_breadcrumb
    add_breadcrumb (t 'activerecord.attributes.message.admin_title'), admin_messages_path
  end

  def name_breadcrumb
    add_breadcrumb  @message.m_title, admin_message_path(@message.id)
  end
end
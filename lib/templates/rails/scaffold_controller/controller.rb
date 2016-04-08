<%- ns = controller_class_name.include?('::') -%># coding: UTF-8
class <%= controller_class_name %>Controller < <%= ns == true ? "#{controller_class_name.split('::').first}::" : ''  %>ApplicationController
  <%- if ns -%>
  load_resource
  authorize_resource
  #before_filter :set_<%= file_name %>, only: [:show, :edit, :update, :destroy]
  before_filter :edit_check, only: [:edit, :update, :destroy]
  before_filter :base_breadcrumb
  before_filter :name_breadcrumb, only: [:show, :edit]

  <%- end -%>
  # GET <%= route_url %>
  def index
    add_breadcrumb t('common.list'), request.path
    @<%= plural_file_name %> = initialize_grid(<%= file_name.camelize %>, page: params[:page], order: :created_at, order_direction: :desc)
  end

  # GET <%= route_url %>/1
  def show
  end

  <%- if ns -%>
  # GET <%= route_url %>/new
  def new
    add_breadcrumb t('common.create'), request.path
  end

  # GET <%= route_url %>/1/edit
  def edit
    add_breadcrumb t('common.edit'), request.path
  end

  # POST <%= route_url %>
  def create
    @<%= file_name %> = <%= orm_class.build(file_name.camelize, "#{file_name}_params") %>

    respond_to do |format|
      if @<%= file_name %>.save
        format.html {
          if(!params[:submit_continue].nil?)
            # 表示继续
            redirect_to new_<%= singular_table_name %>_path(), notice: create_success_notice(:<%= file_name %>)
        else
            redirect_to <%= singular_table_name %>_path(@<%= file_name %>.id), notice: create_success_notice(:<%= file_name %>)
         end
       }
       format.json { render :show, status: :created, location: @<%= file_name %> }
      else
        format.html { render :new }
        format.json { render json: @<%= file_name %>.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT <%= route_url %>/1
  def update
    respond_to do |format|
      if @<%= file_name %>.update_attributes(<%= file_name %>_params)
         format.html {
           if(!params[:submit_continue].nil?)
             # 表示继续
             redirect_to new_<%= singular_table_name %>_path(), notice: update_success_notice(:survey_form)
         else
           redirect_to <%= singular_table_name %>_path(@<%= file_name %>.id), notice: update_success_notice(:<%= file_name %>)
           end
         }
        format.json { head :no_content }
     else
        format.html { render :edit }
        format.json { render json: @<%= file_name %>.errors, status: :unprocessable_entity }
      end
    end
  end

<%- has_deleted_at = false #处理逻辑删除字段
    attributes_names.each do |item|
      if(item == 'deleted_at')
        has_deleted_at = true
      end
    end
        -%>

  # DELETE <%= route_url %>/1
  def destroy
    <% if(has_deleted_at) %>
    begin
      @<%= file_name %>.destroy
    rescue
      @<%= file_name %>.update_attributes(deleted_at: Time.now)
    end
    <% else %>
    @<%= file_name %>.destroy
    <% end %>

    respond_to do |format|
      format.html { redirect_to <%= index_helper %>_path, notice: destroy_success_notice(:<%= file_name %>) }
      format.json { head :no_content }
    end
  end

  def destroy_multi
    ids =params[:grid][:select_ids]
    <% if(has_deleted_at) %>
    begin
      <%= file_name.camelize %>.delete_all(id: ids)
    rescue
     <%= file_name.camelize %>.where(id: ids).update_all(deleted_at: Time.now)
    end
    <% else %>
      <%= file_name.camelize %>.delete_all(id: ids)
    <% end %>

  rescue
    flash[:notice] ="#{t 'common.delete_multi'}#{t 'common.fault'}"
    redirect_to action: 'index'
  else
    flash[:notice] ="#{t 'common.delete_multi'}#{t 'common.success'}"
    redirect_to action: 'index'
  end
  <%- end -%>

  private
  # 获取实体对象
  def set_<%= file_name %>
     @<%= file_name %> = <%= orm_class.find(file_name.camelize, "params[:id]") %>
  end

  # 是否可以编辑或者删除
  def edit_check
    # if(@<%= file_name %>.enabled_at.present?)
    #   redirect_to <%= singular_table_name %>_path(@<%= file_name %>.id), notice: enabled_notice(:<%= file_name %>)
    #   return
    # end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def <%= "#{file_name}_params" %>
     <%- if attributes_names.empty? -%>
     params[<%= ":#{file_name}" %>]
    <%- else -%>
    params.require(<%= ":#{file_name}" %>).permit(<%= attributes_names.map { |name| ":#{name}" }.join(', ') %>)
    <%- end -%>
  end

  def base_breadcrumb
    add_breadcrumb (t 'activerecord.attributes.<%= file_name %>.admin_title'), <%= index_helper %>_path
  end

  def name_breadcrumb
    add_breadcrumb  @<%= file_name %>.name, <%= singular_table_name %>_path(@<%= file_name %>.id)
  end
end
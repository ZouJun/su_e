module ApplicationHelper

  # 通过传入参数,判断并生成表单提交的地址
  def form_path(object)
    polymorphic_path object
  end

  # 判断对象生成表单提交的类别
  def form_method(object)
    object.respond_to?(:persisted?) && object.persisted? ? :put : :post
  end

  #表格的操作列
  # @param [Object] path 基础url方法的名称
  # @param [Integer] id 对应model的id
  # @param [Object] options 可选参数{do_show: true, do_edit: true, do_delete: true, pjax: true}
  def grid_operator(path, id, options = {})
    _options = {do_show: true, do_edit: true, do_delete: true, pjax: false}.merge(options)
    show, edit, delete = '', '', ''

    show = link_to send(path, id), class: [_options[:pjax] ? :pjax : '', :btn, 'btn-xs', 'btn-success'], :'v-su-tip' => '查看', :'tip-color' => 'success', title: "#{t 'common.show'}" do
      "<i class='fa fa-search fa-fw bigger-120'></i>".html_safe
    end if _options[:do_show]

    edit = link_to send("edit_#{path.to_s}", id), class: [_options[:pjax] ? :pjax : '', :btn, 'btn-xs', 'btn-warning'], :'v-su-tip' => '编辑', :'tip-color' => 'warning', title: "#{t 'common.edit'}" do
      "<i class='fa fa-edit fa-fw bigger-120'></i>".html_safe
    end if _options[:do_edit]

    delete = link_to send(path, id), method: :delete, title: "#{t 'common.delete'}", class: [:btn, 'btn-xs', 'btn-danger'], :'v-su-tip' => '删除', :'tip-color' => 'error', data: {confirm: "#{t 'common.confirm_delete'}"} do
      "<i class='fa fa-trash fa-fw bigger-120'></i>".html_safe
    end if _options[:do_delete]

    "<div class='visible-md visible-lg hidden-sm hidden-xs btn-group'>#{options[:html] if options[:html]} #{show} #{edit} #{delete}</div>".html_safe
  end

  def form_validate(resource)
    return if resource.errors.blank?
    html = '
      <form-hoz-row>
        <div class="alert alert-danger">
          您提交的表单有以下错误：
          <ul>
    '
    resource.errors.full_messages.each do |message|
      html+= "<li>#{message}</li>"
    end
    html+='</ul>
        </div>
      </form-hoz-row>'
    html.html_safe
  end

  def yyyy_mm_dd(datetime)(datetime)
    datetime.strftime(Const::YYYY_MM_DD) if datetime.present?
  end

  def yyyy_mm_dd_h_m(datetime)
    datetime.strftime(Const::YYYY_MM_DD_H_M) if datetime.present?
  end
end

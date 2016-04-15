module Admin::DocumentsHelper
  def uploader_render(document)
    document.student.s_name if document.student.present?
    document.teacher.t_name if document.teacher.present?
    document.user.name if document.user.present?
  end
end

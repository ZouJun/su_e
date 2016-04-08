class Admin::DashboardController < Admin::ApplicationController
  before_filter :base_breadcrumb
  def index
  end


  private
  def base_breadcrumb
    add_breadcrumb "仪表盘", admin_path
  end
end

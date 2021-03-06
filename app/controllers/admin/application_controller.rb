class Admin::ApplicationController < ApplicationController
  layout "admin/application"

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :authenticate_user! #, unless: [:other_controller]
end

require 'helpers/basic_helper'

class Entry < Grape::API
  format :json
  default_format :json

  prefix :api

  helpers ::BasicHelper

  rescue_from :all do |e|
    GeneralLog.write :error, "#{e.message}:#{e.backtrace}"
    begin
      req = Rack::Request.new(env)
      Debug.create(message: e.message, backtrace: e.backtrace, ip: req.ip, source: req.user_agent)
    rescue => ex
      GeneralLog.write :error, "#{ex.message}:#{ex.backtrace}"
    end
    error!({error_description: '服务器忙，请稍后再试。'}, 500)
  end

  rescue_from Grape::Exceptions::ValidationErrors do |e|
    error!({error_description: e.full_messages}, 400)
  end

  # mount ::V1::LawRecords
  # mount ::V1::Orders
  # mount ::V1::Users
  # mount ::V1::Cars
  add_swagger_documentation\
    specific_api_documentation: {desc: ''}
end
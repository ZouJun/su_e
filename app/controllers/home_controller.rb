class HomeController < ApplicationController
  def index
    # sleep 5
    User.find(1).owner = Teacher.new 23145


    t = Teacher.create
    User.find(1).owner_id = t.id
    User.find(1).owner_type = 'Teacher'


  end
end

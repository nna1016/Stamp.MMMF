class HomesController < ApplicationController
  before_action -> {access_control(2)}, except: [:index, :info, :tyusen]
  before_action :access_log
  
  def index
    @get_stamp = GetStamp.where(student_no: current_user.student_no)
    @stamp = Stamp.all
    @prize = Prize.find_by(student_no: current_user.student_no)
  end
  
  def setting
  end

  def info
    if current_user.nil?
      @login = false
    else 
      @login = true
    end
  end
end

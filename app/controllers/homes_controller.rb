class HomesController < ApplicationController
  before_action -> {access_control(2)}, except: [:index, :info, :tyusen]
  before_action :access_log
  
  def index
    if GetStamp.find_by(student_no: current_user.student_no, stamp_id: "act").nil?
      GetStamp.create({student_no: current_user.student_no, number: 0, stamp_id: "act"})
      flash[:notice] = '登録ボーナスのスタンプGET！'
    end
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

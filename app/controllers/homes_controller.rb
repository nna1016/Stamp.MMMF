class HomesController < ApplicationController
  before_action -> {access_control(2)}, except: [:index, :info, :tyusen]
  before_action :access_log
  def index
    @all_ranks = User.where(role_flag: 1).where.not(confirmed_at: nil).order(point: "DESC") ## ポイントの降順
    @prize = Prize.find_by(student_no: current_user.student_no)
  end
  
  def qr_list
    @url = "https://www.mmmf.jp/distributions/"
    @distributions = Distribution.all
  end
  
  def lottery_student_list
    @users = User.where(role_flag: 1)
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
  def prizelist
  end
end

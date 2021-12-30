class QuestsController < ApplicationController
  before_action :access_log
  def quest
    session.delete(:reserve)
    @quetion = Problem.find_by(id: params[:id])
    if @quetion.nil?
      render file: "#{Rails.root}/public/404.html", layout: false, status: 404 and return
    end
    session[:reserve] = @quetion
  end  
  
  def success
    @user = User.find(current_user.id)
    @quetion = Problem.new(session[:reserve])
    if URI(request.referer.to_s).path != "/quests/#{@quetion.id}/quest"
      if @quetion.nil?
        redirect_to :root and return
      else
        redirect_to "/quests/#{@quetion.id}/quest" and return
      end
    end 

    @answered = AnsweredUser.find_by(student_no: current_user.student_no, answered_quest: @quetion.id)
    @ans = params[:ans]

    if @ans != @quetion.answer
      @ans_flag = false
    else
      @ans_flag = true
    end

    if current_user.role_flag == "1"
      begin
        @flag = false if !@answered.answered_quest.nil?
      rescue
        @flag = true
        User.find(current_user.id).update(point: @quetion.point + @user.point)
        AnsweredUser.create(student_no: current_user.student_no, answered_quest: @quetion.id)
        @user = User.find(current_user.id)
      end
    end
    
  end

end

class AdminimanagesController < ApplicationController
  def in
  end
  def out
  end
  def success
    user = Adminimanage.find_by(user_id: params[:user_id])
    if user.nil?
      flash[:alert] = "ユーザーが見つかりませんでした"
      redirect_to adminimanages_error_path
    elsif user.in.nil?
      user.update(in: Time.now.to_s(:db))
    else  
      user.update(out: Time.now.to_s(:db))
    end
  end
  def error
  end
  def form
    @adminimanage = Adminimanage.new
  end
  def create
    adminimanage_params[:user_id].to_i.times {
      Adminimanage.create(user_id: SecureRandom.alphanumeric(16))
    }
    redirect_to "/adminimanages/form", notice: adminimanage_params[:user_id].to_s + "個作成しました！" and return
  end
  def adminimanage_params
    params.permit(:user_id)
  end
end

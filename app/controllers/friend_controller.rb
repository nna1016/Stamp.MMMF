class FriendController < ApplicationController
  before_action :access_log
  def form
    if point_stop
      respond_to do |format|
        format.html { redirect_to :root, notice: "登録期間が終了しました" }
      end
    else
      if Friend.find_by(student_no: current_user.student_no) != nil
        @flag = false
      else 
        @flag = true
      end
    end
  end

  def find
    student_no = params[:student_no].upcase
    if !student_no.match?(/\A[K]+[0-9]{3}[A-Z]{1}[0-9]{4}\z/)
      flash[:alert] = "学籍番号の形式が正しくありません"
      redirect_to friend_form_path and return
    end
    respond_to do |format|
      if current_user.student_no == student_no
        format.html { redirect_to friend_form_path, notice: "自分の学籍番号は無効です" }
      elsif User.find_by(student_no: student_no) != nil
        Friend.create(student_no: current_user.student_no, friend_student_no: student_no)
        User.find(current_user.id).update(point: current_user.point + 5)
        format.html { redirect_to :root, notice: "5ポイント獲得しました！" }
      else
        format.html { redirect_to friend_form_path, notice: params[:student_no] + "は未登録です。" }
      end
    end
  end
end

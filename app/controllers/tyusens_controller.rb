class TyusensController < ApplicationController

  def index
    @qr = format("%06d#{current_user.student_no}", current_user.id.to_i * 16)
   
  end

  def new
    @tyusens = Tyusen.new
    @prize = session[:prize]
    @prize_cnt = Prize.all.sum:qty
  end

  def lottery
    qr = params[:student_no]
    begin
      if User.find_by(id: qr.slice(0..6).to_i / 16).student_no == qr.slice(6..-1)
        prize_list = []
        all_prize_list = Prize.all
        prize_cnt = Prize.all.sum:qty
        all_prize_list.each do |prize|
          prize.qty.times do |time|
            prize_list.append(prize.prize)
          end
        end
        result = prize_list[rand(0..prize_cnt-1)]
        prize = Prize.find_by(prize: result)
        session[:prize] = prize
        prize.update(prize: prize.prize, qty: prize.qty - 1, category: prize.category)
        
      else
        flash[:alert] = "ユーザーが見つかりませんでした"
        redirect_to tyusens_path
      end
    rescue
      flash[:alert] = "ユーザーが見つかりませんでした"
      redirect_to tyusens_path
    end
  end

end

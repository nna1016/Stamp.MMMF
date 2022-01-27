class TyusensController < ApplicationController
  
  def new
    @tyusens = Tyusen.new
    @prize = session[:prize]
    @prize_cnt = Prize.all.sum:qty
  end

  def lottery
    qr = params[:student_no]
    begin
      if User.find_by(id: qr.slice(0..6).to_i / 16).student_no == qr.slice(6..-1)
        user_stamp = GetStamp.where(student_no: qr.slice(6..-1)).count
        if user_stamp == 1
          session[:prize] = Prize.find_by(prize: "参加賞")
        elsif user_stamp <= 4
          prize_random_middle()
        else
          prize_random_all()
        end
      else
        flash[:alert] = "ユーザーが見つかりませんでした"
        redirect_to tyusens_path
      end
    rescue
      flash[:alert] = "ユーザーが見つかりませんでした"
      redirect_to tyusens_path
    end
  end

  def prize_random_all()
    prize_list = []
    prize_cnt = Prize.all.sum:qty
    all_prize_list = Prize.all
    all_prize_list.each do |prize|
      prize.qty.times do |time|
        prize_list.append(prize.prize)
      end
    end
    result = prize_list[rand(0..prize_cnt-1)]
    prize = Prize.find_by(prize: result)
    session[:prize] = prize
    prize.update(prize: prize.prize, qty: prize.qty - 1, category: prize.category)
  end

  def prize_random_middle()
    prize_list = []
    prize_cnt = Prize.all.sum:qty
    all_prize_list = Prize.all.where.not(category: "豪華")
    
    all_prize_list.each do |prize|
      prize.qty.times do |time|
        prize_list.append(prize.prize)
      end
    end
    result = prize_list[rand(0..prize_cnt-1)]
    prize = Prize.find_by(prize: result)
    session[:prize] = prize
    prize.update(prize: prize.prize, qty: prize.qty - 1, category: prize.category)
  end

end

class TyusensController < ApplicationController
  before_action -> {access_control(3)}
  def hinamatsuri
    @tyusens = Tyusen.new
    @prize = session[:prize]
    @prize_cnt = 0
    Prize.all.each do |prize|
      @prize_cnt += prize.qty if prize.kind == "ひなまつり"
    end
  end

  def valentine
    @tyusens = Tyusen.new
    @prize = session[:prize]
    @prize_cnt = 0
    Prize.all.each do |prize|
      @prize_cnt += prize.qty if prize.kind == "バレンタイン"
    end
  end

  def lottery  
    qr = params[:student_no]
    session[:prize] = ""
    user = User.find_by(id: qr.slice(0..6).to_i / 16)

    if user.nil?
      flash[:alert] = "ユーザーが見つかりませんでした"
      redirect_to  request.referer
    elsif request.referer.include?("valentine")
      #if !Tyusen.find_by(student_no: user.student_no, kind: "バレンタイン").nil?
      #  flash[:alert] = "既に抽選に参加済みです"
      #  redirect_to  request.referer and return
      #end
      prize_list = []
      Prize.all.each do |prize|
        prize.qty.times do |time|
          prize_list.append(prize.prize)
        end
      end
      result = prize_list[rand(0..Prize.all.sum(:qty)-1)]
      prize = Prize.find_by(prize: result)
      session[:prize] = Prize.find_by(prize: result)
      Tyusen.create({student_no: user.student_no, kind: "バレンタイン", prize: result})
      prize.update(prize: prize.prize, kind: "バレンタイン", qty: prize.qty - 1, category: prize.category)  
    elsif request.referer.include?("hinamatsuri")
      if !Tyusen.find_by(student_no: user.student_no, kind: "ひなまつり").nil?
        flash[:alert] = "既に抽選に参加済みです"
        redirect_to  request.referer and return
      end
      user_stamp = GetStamp.where(student_no: qr.slice(6..-1)).count
      if user_stamp <= 2
        session[:prize] = Prize.find_by(kind: "ひなまつり", prize: "かまトゥグッズ")
        Tyusen.create(student_no: user.student_no, kind: "ひなまつり", prize: "かまトゥグッズ")
        prize = Prize.find_by(kind: "ひなまつり", prize: "かまトゥグッズ")
        prize.update(prize: "かまトゥグッズ", kind: "ひなまつり", qty: prize.qty - 1, category: prize.category)
      elsif user_stamp <= 4
        prize_random_middle(user.student_no)
      else
        prize_random_all(user.student_no)
      end
    else
      redirect_to request.referer, notice: "もう一度読み取ってください"
    end
  end

  def prize_random_all(student_no)
    prize_list = []
    Prize.all.each do |prize|
      prize.qty.times do |time|
        prize_list.append(prize.prize)
      end
    end
    result = prize_list[rand(0..Prize.all.sum(:qty)-1)]
    prize = Prize.find_by(prize: result)
    session[:prize] = Prize.find_by(prize: result)
    Tyusen.create({student_no: student_no, kind: "ひなまつり", prize: result})
    prize.update(prize: prize.prize, kind: "ひなまつり", qty: prize.qty - 1, category: prize.category)
  end

  def prize_random_middle()
    prize_list = []    
    Prize.all.where.not(category: "豪華").each do |prize|
      prize.qty.times do |time|
        prize_list.append(prize.prize)
      end
    end
    result = prize_list[rand(0..Prize.all.sum(:qty)-1)]
    prize = Prize.find_by(prize: result)
    session[:prize] = prize
    Tyusen.create(student_no: student_no, kind: "ひなまつり", prize: result)
    prize.update(prize: prize.prize, kind: "ひなまつり", qty: prize.qty - 1, category: prize.category)
  end

end

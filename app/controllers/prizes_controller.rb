class PrizesController < ApplicationController
  before_action :set_prize, only: %i[ show edit update destroy ]
  before_action -> {access_control(2)}, :access_log


  # GET /prizes or /prizes.json
  def index
    @prizes = Prize.all
  end

  # GET /prizes/1 or /prizes/1.json
  def show
  end

  # GET /prizes/new
  def new
    @prize = Prize.new
  end

  # GET /prizes/1/edit
  def edit
  end

  # POST /prizes or /prizes.json
  def create
    @prize = Prize.new(prize_params)
    begin
      role = User.find_by(student_no: @prize.student_no).role_flag.to_i
      flag = role == 1
    rescue
      role = 0
      flag = false
    end

    if flag
      begin
      respond_to do |format|
        if @prize.save
          format.html { redirect_to @prize, notice: "新規登録しました！" }
          format.json { render :show, status: :created, location: @prize }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @prize.errors, status: :unprocessable_entity }
        end
      rescue
        format.html { redirect_to prizes_path, notice: @prize.student_no + "は登録済みです" }
        format.json { render :prize, status: :created, location: @prize }
        end
      end
    else
      respond_to do |format|
        if role >= 2
          format.html { redirect_to prizes_path, notice: @prize.student_no + "は一般ユーザーではないため登録できません。" }
        else
          format.html { redirect_to prizes_path, notice: @prize.student_no + "は存在しないユーザーです" }
        end
          format.json { render :prize, status: :created, location: @prize }
      end
    end
  end

  # PATCH/PUT /prizes/1 or /prizes/1.json
  def update
    prize = Prize.new(prize_params)
    begin
      role = User.find_by(student_no: prize.student_no).role_flag.to_i
      flag = role == 1
    rescue
      role = 0
      flag = false
    end
    if flag
      respond_to do |format|
        if @prize.update(prize_params)
          format.html { redirect_to @prize, notice: "更新しました！" }
          format.json { render :show, status: :ok, location: @prize }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @prize.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        if role >= 2
          format.html { redirect_to prizes_path, notice: @prize.student_no + "は一般ユーザーではないため更新できません。" }
        else
          format.html { redirect_to prizes_path, notice: @prize.student_no + "は存在しないユーザーです" }
        end
          format.json { render :prize, status: :created, location: @prize }
      end
    end
  end

  # DELETE /prizes/1 or /prizes/1.json
  def destroy
    @prize.destroy
    respond_to do |format|
      format.html { redirect_to prizes_url, notice: "削除しました！" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prize
      @prize = Prize.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def prize_params
      params.require(:prize).permit(:student_no, :prize, :reg_user)
    end
end

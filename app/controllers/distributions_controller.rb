class DistributionsController < ApplicationController
  before_action :set_distribution, only: %i[ show edit update destroy ]
  before_action :access_log
  before_action -> {access_control(2)}, except: [:show]
  # GET /distributions or /distributions.json
  def index
    @distributions = Distribution.all
    @cnt = Distribution.count
    @unused = Distribution.where(student_no: "0").count
    @used = Distribution.where.not(student_no:   "0").count
  end

  # GET /distributions/1 or /distributions/1.json
  # 付与する際にこのshowページを使うのでここは全員見れる
  def show
    if point_stop
      respond_to do |format|
        format.html { redirect_to :root, notice: "付与期間が終了しました" }
      end
    else
      @user = User.find(current_user.id)
      begin
      @qr = Distribution.find(params[:id])
      rescue
        redirect_to :root
      end
      @flag = true

      @dis = Distribution.find_by(student_no: current_user.student_no)
      if current_user.role_flag == "1" and @dis.nil? and @qr.student_no == "0"
        User.where(id: current_user.id).update(point: @user.point.to_i + 10)
        @user = User.find(current_user.id)
        Distribution.find(params[:id]).update(student_no: current_user.student_no)
      else 
        @flag = false
      end
    end
  end

  # GET /distributions/new
  def new
    @distribution = Distribution.new
  end

  # GET /distributions/1/edit
  def edit
  end

  # POST /distributions or /distributions.json
  def create
    distribution_params[:id].to_i.times {
      Distribution.create(id: SecureRandom.alphanumeric(16))
    }
    redirect_to "/distributions", notice: distribution_params[:id].to_s + "個作成しました！"
  end

  # PATCH/PUT /distributions/1 or /distributions/1.json
  def update
    respond_to do |format|
      if @distribution.update(distribution_params)
        format.html { redirect_to @distribution, notice: "Distribution was successfully updated." }
        format.json { render :show, status: :ok, location: @distribution }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @distribution.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /distributions/1 or /distributions/1.json
  def destroy
    @distribution.destroy
    respond_to do |format|
      format.html { redirect_to distributions_url, notice: "Distribution was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_distribution
      begin
        @distribution = Distribution.find(params[:id])
      rescue
        redirect_to "javascript:history.back()"
      end
    end

    # Only allow a list of trusted parameters through.
    def distribution_params
      params.require(:distribution).permit(:id)
    end
end

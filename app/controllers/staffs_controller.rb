class StaffsController < ApplicationController
  before_action :set_staff, only: %i[ show edit update destroy ]

  def admin_invite

  end
  def admin_regi
    name = params[:name]
    student_no = params[:student_no]
    email = params[:email]
    role_flag = "4"
    encrypted_password = Hash.new(params[:password])
    confirmation_token = Hash.new(student_no)
    confirmation_sent_at = Time.now.to_s(:db)
    User.create(email: email,student_no: name,student_no: student_no,encrypted_password: encrypted_password,role_flag: role_flag,confirmation_token: confirmation_token,confirmation_sent_at: confirmation_sent_at)
    flash[:alert] = "登録できました"
    redirect_to destroy_user_session_path
  end
  # GET /staffs or /staffs.json
  def index
    @staffs = Staff.all
  end

  # GET /staffs/1 or /staffs/1.json
  def show
  end

  # GET /staffs/new
  def new
    @staff = Staff.new
  end

  # GET /staffs/1/edit
  def edit
  end

  # POST /staffs or /staffs.json
  def create
    @staff = Staff.new(staff_params)

    respond_to do |format|
      if @staff.save
        format.html { redirect_to @staff, notice: "Staff was successfully created." }
        format.json { render :show, status: :created, location: @staff }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @staff.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /staffs/1 or /staffs/1.json
  def update
    respond_to do |format|
      if @staff.update(staff_params)
        format.html { redirect_to @staff, notice: "Staff was successfully updated." }
        format.json { render :show, status: :ok, location: @staff }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @staff.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /staffs/1 or /staffs/1.json
  def destroy
    @staff.destroy
    respond_to do |format|
      format.html { redirect_to staffs_url, notice: "Staff was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  def import
    Staff.import(params[:file])
    redirect_to staffs_path
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_staff
      @staff = Staff.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def staff_params
      params.require(:staff).permit(:staff_id, :group, :info)
    end

end

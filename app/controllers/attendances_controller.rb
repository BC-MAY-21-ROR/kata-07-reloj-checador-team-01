class AttendancesController < ApplicationController
  before_action :set_attendance, only: %i[ show edit update destroy ]
  before_action :set_employee, only: %i[ check_in check_out ]

  # POST /check-in
  def check_in
    @attendance = Attendance.attendance_check_in_manage(@employee)
    return render json: {"message": @attendance }, status: :accepted
  end

  # GET /attendances-today
  def today 
    @attendances = Attendance.today_attendances
  end

  # POST /check-out
  def check_out
    @attendance = Attendance.attendance_check_out_manage(@employee)
    return render json: {"message": @attendance }, status: :accepted
  end

  # GET /attendances or /attendances.json
  def index
    @attendances = Attendance.all
  end

  # GET /attendances/1 or /attendances/1.json
  def show
  end

  # GET /attendances/new
  def new
    @attendance = Attendance.new
  end

  # GET /attendances/1/edit
  def edit
  end

  # POST /attendances or /attendances.json
  def create
    @attendance = current_user.attendances.new(attendance_params)
    respond_to do |format|
      if @attendance.save
        format.json { render :show, status: :created, location: @attendance }
      else
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attendances/1 or /attendances/1.json
  def update
    respond_to do |format|
      if @attendance.update(attendance_params)
        format.json { render :show, status: :ok, location: @attendance }
      else
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attendances/1 or /attendances/1.json
  def destroy
    @attendance.destroy
    respond_to do |format|
      format.html { redirect_to attendances_url, notice: "Attendance was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attendance
      @attendance = Attendance.find(params[:id])
    end
    #find an employee by private number and set its object to @employee variable
    def set_employee
      @employee = Employee.find_by private_number: params[:private_number]
      unless @employee.present?
        return render json: {"message": "The user with these private number does not exist"}, status: :unprocessable_entity
      end
    end

    # Only allow a list of trusted parameters through.
    def attendance_params
      params.require(:attendance).permit(:check_in, :check_out, :employee_id)
    end

end

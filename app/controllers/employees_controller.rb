# EmployeesController is responsible for the crud of an Employee
class EmployeesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_employee, only: %i[ show edit update destroy ]
  before_action :set_employees, only: %i[index, avg_time]
  
  # GET /employees or /employees.json
  def index
  end

  # GET /attendances-avg-time
  def avg_time
  end

  # GET /employees/1 or /employees/1.json
  def show
  end

  # GET /employees/new
  def new
    @employee = Employee.new
  end

  # GET /employees/1/edit
  def edit
  end

  # POST /employees or /employees.json
  def create
    begin
      @employee = Employee.new(employee_params)
      @employee.user_id  = current_user.id
      respond_to do |format|
        if @employee.save
          format.html { redirect_to @employee, notice: "Employee was successfully created." }
        else
          format.html { render :new, status: :unprocessable_entity }
        end
      end
    rescue ActiveRecord::RecordNotUnique
      flash[:msg] = "El email debe ser unico"
      redirect_to new_employee_path
    end
  end

  # PATCH/PUT /employees/1 or /employees/1.json
  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to @employee, notice: "Employee was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1 or /employees/1.json
  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employees_url, notice: "Employee was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    #Get the all the employees and set to @employees variable
    def set_employees
      @employees = Employee.all
    end

    # Only allow a list of trusted parameters through.
    def employee_params
      params.require(:employee).permit(:name, :email, :private_number, :user_id)
    end
end

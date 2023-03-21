class EmployeesController < ApplicationController
  before_action :find_employees, only: [:show, :edit, :update, :destroy]
  def index
    @employees = Employee.all
  end

  def show
  end

  def new
    @employee = Employee.new
  end

  def create
      @employee = Employee.new(employee_params)

      if @employee.save
        redirect_to '/employees', notice: 'Created!!'
      else
        render :new
      end
  end

  def edit

  end

  def update
    if @employee.update(employee_params)
      redirect_to '/employees', notice: 'Edited!!'
    else
      render :edit
    end
 end

  def destroy
    @employee.destroy
    redirect_to '/employees', notice: 'DELETED!!'
  end

  private
    def employee_params
      params.require(:employee).permit(:name, :age, :gender, :designation)
    end
    def find_employees
      @employee = Employee.find_by(id: params[:id])
    end
end

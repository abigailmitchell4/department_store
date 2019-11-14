class DepartmentsController < ApplicationController
  before_action :set_department, except: [:index, :new, :create]

  def index
  #GET	/departments
  @departments = Department.all
  end

  def show
  #GET	/departments/:id
  end

  def new
  #GET	/departments/new
  @department = Department.new
  render partial: "form"
  end

  def edit
  #GET	/departments/:id/edit
  render partial: "form"
  end

  def create
  #POST	/departments
    @department = Department.new(department_params)
    if @department.save
      redirect_to departments_path
    else
      render :new
    end
  end

  def update
  #PUT	/departments/:id
    if @department.update(department_params)
      redirect_to department_path(@department.id)
    else
      render :edit
    end
  end

  def destroy
  #DELETE	/departments/:id
  @department.destroy
  redirect_to departments_path
  end

  private
    def department_params
      params.require(:department).permit(:name)
    end

    def set_department
      @department = Department.find(params[:id])
    end

end

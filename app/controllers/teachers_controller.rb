class TeachersController < ApplicationController
  before_action :signed_in_user
  before_action :admin_user,     only: [:edit, :update, :destroy, :create, :new]
  def new
    @teacher = Teacher.new
  end

  def index
    @teachers= Teacher.all
  end

  def edit
    @teacher = Teacher.find(params[:id])
  end

  def update
    @teacher = Teacher.find(params[:id])
    if @teacher.update_attributes(teacher_params)
      flash[:success]="Преподаватель изменен"
      redirect_to teachers_path
    else
      render 'edit'
    end
  end

  def destroy
    Teacher.find(params[:id]).destroy
    flash[:success] = "Преподаватель удален"
    redirect_to teachers_path
  end

  def create
    @teacher = Teacher.new(teacher_params)
    if @teacher.save
      flash[:success] = "Преподаватель добавлен"
      redirect_to '/teachers'
    else
      render 'new'
    end
  end

  private

  def teacher_params
    params.require(:teacher).permit(:name, :family_name, :second_name)
  end

  #before filters

  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_url, notice: "Пожалуйста авторизуйтесь"
    end
  end

  def admin_user
    redirect_to(root_url, notice: "Недостаточно прав") unless current_user.admin?
  end
end

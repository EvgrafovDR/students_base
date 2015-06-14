class FacultiesController < ApplicationController
  before_action :signed_in_user
  before_action :admin_user,     only: [:edit, :update, :destroy, :create, :new]
  def new
    @faculty = Faculty.new
  end

  def index
    @faculties= Faculty.all
  end

  def edit
    @faculty = Faculty.find(params[:id])
  end

  def update
    @faculty = Faculty.find(params[:id])
    if @faculty.update_attributes(faculty_params)
      flash[:success]="Факультет изменен"
      redirect_to faculties_path
    else
      render 'edit'
    end
  end

  def destroy
    Faculty.find(params[:id]).destroy
    flash[:success] = "Факультет удален"
    redirect_to faculties_path
  end

  def create
    @faculty = Faculty.new(faculty_params)
    if @faculty.save
      flash[:success] = "Факультет добавлен"
      redirect_to '/faculties'
    else
      render 'new'
    end
  end

  private

  def faculty_params
    params.require(:faculty).permit(:name)
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

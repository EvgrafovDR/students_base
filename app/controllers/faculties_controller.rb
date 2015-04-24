class FacultiesController < ApplicationController
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
end

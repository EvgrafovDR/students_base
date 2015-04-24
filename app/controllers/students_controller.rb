class StudentsController < ApplicationController
  def new
    @student = Student.new
  end

  def index
    @students= Student.joins('INNER JOIN faculties ON faculties.id = students.faculty_id')
                   .joins('INNER JOIN teachers ON teachers.id = students.teacher_id')
                   .joins('INNER JOIN groups ON groups.id = students.group_id')
                   .select("students.*, faculties.name as fname, teachers.family_name as tname, groups.name as gname")
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    if @student.update_attributes(student_params)
      flash[:success]="Студент изменен"
      redirect_to students_path
    else
      render 'edit'
    end
  end

  def destroy
    Student.find(params[:id]).destroy
    flash[:success] = "Студент удален"
    redirect_to students_path
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      flash[:success] = "Студент добавлен"
      redirect_to '/students'
    else
      render 'new'
    end
  end

  private

    def student_params
      params.require(:student).permit(:name, :family_name, :second_name, :group_id, :teacher_id, :faculty_id)
    end
end

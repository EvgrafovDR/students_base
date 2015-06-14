class ResultsController < ApplicationController
  before_action :signed_in_user
  before_action :admin_user,     only: [:edit, :update, :destroy, :create, :new]
  def new
    @result = Result.new
  end

  def index
    @results = Result.joins('INNER JOIN dats ON dats.id = results.dat_id')
                 .joins('INNER JOIN norms ON norms.id = results.norm_id')
                 .joins('INNER JOIN students ON students.id = results.student_id')
                 .select('results.*, dats.dat as dat, norms.name as norm, students.family_name as student')
  end

  def edit
    @result = Result.find(params[:id])
  end

  def update
    @result = Result.find(params[:id])
    if @result.update_attributes(result_params)
      flash[:success]="Результат изменен"
      redirect_to results_path
    else
      render 'edit'
    end
  end

  def destroy
    Result.find(params[:id]).destroy
    flash[:success] = "Результат удален"
    redirect_to results_path
  end

  def create
    @result = Result.new(result_params)
    if @result.save
      flash[:success] = "Результат добавлен"
      redirect_to '/results'
    else
      render 'new'
    end
  end

  private

  def result_params
    params.require(:result).permit(:norm_id, :student_id, :dat_id, :result)
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

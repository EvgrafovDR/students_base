class FinesController < ApplicationController
  before_action :signed_in_user
  before_action :admin_user,     only: [:edit, :update, :destroy, :create, :new]
  def new
    @fine = Fine.new
  end

  def index
    @fines = Fine.joins('INNER JOIN dats ON dats.id = fines.dat_id')
                 .joins('INNER JOIN norms ON norms.id = fines.norm_id')
                 .select('fines.*, dats.dat as dat, norms.name as norm')
  end

  def edit
    @fine = Fine.find(params[:id])
  end

  def update
    @fine = Fine.find(params[:id])
    if @fine.update_attributes(fine_params)
      flash[:success]="Штраф изменен"
      redirect_to fines_path
    else
      render 'edit'
    end
  end

  def destroy
    Fine.find(params[:id]).destroy
    flash[:success] = "Штраф удален"
    redirect_to fines_path
  end

  def create
    @fine = Fine.new(fine_params)
    if @fine.save
      flash[:success] = "Штраф добавлен"
      redirect_to '/fines'
    else
      render 'new'
    end
  end

  private

  def fine_params
    params.require(:fine).permit(:norm_id, :dat_id, :fine)
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

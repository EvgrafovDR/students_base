class DatsController < ApplicationController
  before_action :signed_in_user
  before_action :admin_user,     only: [:edit, :update, :destroy, :create, :new]
  def new
    @dat = Dat.new
  end

  def index
    @dats = Dat.all
  end

  def edit
    @dat = Dat.find(params[:id])
  end

  def update
    @dat = Dat.find(params[:id])
    if @dat.update_attributes(dat_params)
      flash[:success]="Дата изменена"
      redirect_to dats_path
    else
      render 'edit'
    end
  end

  def destroy
    Dat.find(params[:id]).destroy
    flash[:success] = "Дата удалена"
    redirect_to dats_path
  end

  def create
    @dat = Dat.new(dat_params)
    if @dat.save
      flash[:success] = "Дата добавлена"
      redirect_to '/dats'
    else
      render 'new'
    end
  end

  private

  def dat_params
    params.require(:dat).permit(:dat)
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


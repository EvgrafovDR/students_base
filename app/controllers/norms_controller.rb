class NormsController < ApplicationController
  before_action :signed_in_user
  before_action :admin_user,     only: [:edit, :update, :destroy, :create, :new]
  def new
    @norm = Norm.new
  end

  def index
    @norms = Norm.joins('INNER JOIN dats ON dats.id = norms.dat_id')
                 .select('norms.*, dats.dat as dat')
  end

  def edit
    @norm = Norm.find(params[:id])
  end

  def update
    @norm = Norm.find(params[:id])
    if @norm.update_attributes(norm_params)
      flash[:success]="Норматив изменен"
      redirect_to norms_path
    else
      render 'edit'
    end
  end

  def destroy
    Norm.find(params[:id]).destroy
    flash[:success] = "Норматив удален"
    redirect_to norms_path
  end

  def create
    @norm = Norm.new(norm_params)
    if @norm.save
      flash[:success] = "Норматив добавлен"
      redirect_to '/norms'
    else
      render 'new'
    end
  end

  private

  def norm_params
    params.require(:norm).permit(:name, :main, :typ,
                                 :dat_id, :v1, :v2, :v3, :v4,
                                 :v5, :v6, :v7, :v8, :v9, :v10)
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

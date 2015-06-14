class GroupsController < ApplicationController
  before_action :signed_in_user
  before_action :admin_user,     only: [:edit, :update, :destroy, :create, :new]
  def new
    @group = Group.new
  end

  def index
    @groups = Group.all
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update_attributes(group_params)
      flash[:success]="Группа изменена"
      redirect_to groups_path
    else
      render 'edit'
    end
  end

  def destroy
    Group.find(params[:id]).destroy
    flash[:success] = "Группа удалена"
    redirect_to groups_path
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      flash[:success] = "Группа добавлена"
      redirect_to '/groups'
    else
      render 'new'
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :gender, :course, :health_group)
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

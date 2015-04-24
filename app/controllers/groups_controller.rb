class GroupsController < ApplicationController
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
end

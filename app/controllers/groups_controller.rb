class GroupsController < ApplicationController
before_action  :set_group, only: [:edit, :update]

  def new
    @group = Group.new
  end

  def create
    # @group = current_user.groups.build(create_params)
    @group = Group.new(create_params)
    
    if @group.save
      redirect_to root_path, notice: 'チャットグループが作成されました。'
     else
       render action: :new
    end
  end

  def show
    @group = Group.find(params[:id])
  end

  def edit

  end

  def update
    if @group.update(create_params)
      redirect_to root_path, notice: 'チャットグループが更新がされました。'
     else
       render action: :edit
    end

  end

  private
  def create_params
    params.require(:group).permit(:group_name)
  end

  def set_group
    @group = Group.find(params[:id])
  end

end


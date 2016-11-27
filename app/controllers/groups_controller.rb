class GroupsController < ApplicationController
before_action  :set_group, only: [:edit, :update,:show]

  def index
  end

  def new
    @group = Group.new
    @group.user_groups.build
  end

  def create
    @group = Group.new(create_params)
    if @group.save
      redirect_to @group, notice: 'チャットグループが作成されました。'
    else
       render action: :new
    end
  end

  def show
    @group = Group.find(params[:id])
    @message = Message.new
  end

  def edit

  end

  def update
    if @group.update(create_params)
      redirect_to group_path, notice: 'チャットグループが更新がされました。'
     else
       render action: :edit
    end
  end

  private
  def create_params
    params.require(:group).permit(:group_name ,{:user_ids =>[]})
  end

  def set_group
    @group = Group.find(params[:id])
  end

end



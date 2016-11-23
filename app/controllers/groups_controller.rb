class GroupsController < ApplicationController

  def new
    @group = Group.new
  end

  def create
    @groups = Group.create(create_params)
    redirect_to controller: :messages, action: :index
  end


  private
  def create_params
    params.require(:group).permit(:group_name)
  end
end


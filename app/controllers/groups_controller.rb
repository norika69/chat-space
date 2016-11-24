class GroupsController < ApplicationController

  def new
    @group = Group.new
  end

  def create
    @group = Group.create(create_params)
    
    if @group.save
       redirect_to root_path
     else
       render action: :new
    end
  end


  private
  def create_params
    params.require(:group).permit(:group_name)
  end
end


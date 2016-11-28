class MessagesController < ApplicationController

before_action :set_group, only: [:create]

  def create
    @message = group.messages.build(message_params)
    @message.valid?
    if @message.save
       redirect_to group_path(params[:id])
    else
       redirect_to group_path(params[:id]),alert: @message.errors.full_messages[0]
    end
  end

  def edit

  end

  def update

  end


private
  def message_params
    params.require(:message).permit(:user_id, :body, :image)
  end

  def set_group
    @group = Group.find(params[:id])
  end
end

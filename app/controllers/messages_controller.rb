class MessagesController < ApplicationController

  def create
    group = Group.find(params[:id])
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

  def destroy

  end

private
  def message_params
    params.require(:message).permit(:user_id, :body, :image)
  end

  def set_message
    @group = Group.find(params[:id])
  end
end

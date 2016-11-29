class MessagesController < ApplicationController

before_action :set_group, only: [:create]

  def create
    @send_message  =  @group.messages.build(message_params)
    @send_message.valid?

    if @send_message.save
      redirect_to group_path(params[:id])
    else
      @group = Group.find(params[:id])
      @message = Message.new
      @messages = @group.messages
      flash.now[:alert] = @send_message.errors.full_messages[0]
      render "groups/show"
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

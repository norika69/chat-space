class MessagesController < ApplicationController

before_action :set_group, only: [:create]

  def create
    @send_message  =  @group.messages.build(message_params)
    @send_message.valid?
    
    if @send_message.save
      respond_to do |format|
      format.html { redirect_to group_path(params[:id])} # この中はHTMLリクエストの場合に呼ばれる
      format.json {
        render json: {
          body: @send_message.body,
          name: current_user.name,
          time: @send_message.created_at.strftime("%Y/%m/%d %H:%M:%S"),
          image: @send_message.image
        }
      }
    end
    else
      @group = Group.find(params[:id])
      @message = Message.new
      @messages = @group.messages
      flash.now[:alert] = @send_message.errors.full_messages[0]
      render "groups/show"
    end
  end



private
  def message_params
    params.require(:message).permit(:user_id, :body, :image)
  end

  def set_group
    @group = Group.find(params[:id])
  end
end

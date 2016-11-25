class MessagesController < ApplicationController
  def index
    @group = Group.find(current_user.id)
  end
end

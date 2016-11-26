class MessagesController < ApplicationController
  def index
    @group = Group.find(current_user)
  end
end

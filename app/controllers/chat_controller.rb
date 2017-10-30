class ChatController < ApplicationController
  def index
    @channels = SlackApiWrapper.list_channels
  end

  def new
    @channel = params["channel"]
  end

  def create
    result = SlackApiWrapper.send_msg params["channel"], params["message"]

    if result
      flash[:success] = "Message Posted!"
    else
      flash[:error] = "Error!"
    end

    redirect_to root_path


  end
end

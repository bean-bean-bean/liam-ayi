class MessagesController < ApplicationController
  before_action :set_message, only: [:update, :destroy, :show, :edit]

  def index
    @messages = Message.all
  end

  def show
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to messages_path
    else
      render :new
    end
  end

  def update
    @message = Message.update(message_params)
    redirect_to messages_path
  end

  def destroy
    @message.destroy
    redirect_to messages_path
  end

  private

  def message_params
    params.require(:message).permit(:title, :content)
  end

  def set_message
    @message = Message.find(params[:id])
  end
end

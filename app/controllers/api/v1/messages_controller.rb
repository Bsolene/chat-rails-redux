class Api::V1::MessagesController < ApplicationController

  before_action :find_channel, only: [:index, :create]

  def index
    @messages = @channel.messages.order(created_at: :asc)
    @messages = @messages.select(['id', 'created_at'])
                         .joins(:channel).select('name')
                         .joins(:user).select(['nickname', 'content'])
    render json: @messages
  end

  def create
    @message = Message.create(message_params)
    @message.user = current_user
    @message.channel = @channel
    @message.save

    render json: serialize_message(@message)

  end

  private

  def serialize_message(message)
    { id: message.id, content: message.content, created_at: message.created_at, name: message.channel.name, nickname: message.user.nickname}

  end

  def message_params
    params.require(:message).permit(:content, :channel)
  end

  def find_channel
    @channel = Channel.find_by(name: params[:channel_id])
  end

end

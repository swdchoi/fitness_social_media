class ChatChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "chat_general"
  end

  def speak(data)
    ActionCable.server.broadcast("chat_general", data["message"])
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end

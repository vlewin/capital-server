# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class EventChannel < ApplicationCable::Channel
  def receive(payload)
    ActionCable.server.broadcast('messages', {message: 'message', event_id: '1' })
  end

  def subscribed
    puts "*** subscribed"
    stream_from "messages"
    # stream_from "user_#{uuid}"
  end

  def unsubscribed
    puts "*** unsubscribed"
    # Any cleanup needed when channel is unsubscribed
  end
end

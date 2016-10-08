# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class EventChannel < ApplicationCable::Channel
  def receive(payload)
    puts "*** Received payload: #{payload.inspect}"
    # ActionCable.server.broadcast('events', {message: 'message', event_id: '1' })
  end

  def subscribed
    puts "*** subscribed"
    stream_from "events"
  end

  def unsubscribed
    puts "*** unsubscribed"
  end
end

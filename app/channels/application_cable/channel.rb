module ApplicationCable
  class Channel < ActionCable::Channel::Base

    def connect
      puts "**************************"
      self.uuid = SecureRandom.uuid
    end
  end
end

module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :uuid

    def connect
      puts "**************************"
      self.uuid = SecureRandom.uuid
    end
  end
end

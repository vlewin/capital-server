class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  after_update :notify
  after_save :notify


  def notify
    ActionCable.server.broadcast('events', { type: 'created', record: self })
  end
end

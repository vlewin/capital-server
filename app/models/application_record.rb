class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # after_update :notify
  # after_save :notify

  after_update do
    puts 'Record updated'
    self.notify('updated')
  end

  after_save do
    puts 'Record created'
    self.notify('created')
  end

  def notify(action)
    ActionCable.server.broadcast('events', { type: 'record', state: action, class: self.class.name.downcase, item: self })
  end
end

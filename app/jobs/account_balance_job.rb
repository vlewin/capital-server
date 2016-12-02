class AccountBalanceJob < ApplicationJob
  RUN_EVERY = 10.seconds
  queue_as :default

  after_perform do |job|
    puts "After perform re-enqueue"
    # byebug
    # self.perform(wait: RUN_EVERY)
  end

  def perform(*args)
    puts "Run job"

    # Do something later
    sleep 1
    ActionCable.server.broadcast('events', { type: 'job', state: 'done', class: self.class.name.downcase, item: { id: SecureRandom.uuid } })

    self.class.set(wait: RUN_EVERY).perform_later()
  end
end

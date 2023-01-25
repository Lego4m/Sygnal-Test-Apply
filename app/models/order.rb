class Order < ApplicationRecord
  enum status: {
    pending: 'pending',
    in_progress: 'in_progress',
    finished: 'finished'
  }

  validates(:status, {
    inclusion: {
      in: ['pending'],
      message: 'A new order must be in pending status.',
    },
    on: :create
  })

  # Class Methods
  def self.can_update_status(previousStatus, status)
    return false if (previousStatus == 'pending' && status != 'in_progress')

    return false if (previousStatus == 'in_progress' && status != 'finished')

    return false if (previousStatus == 'finished')

    return true
  end
end

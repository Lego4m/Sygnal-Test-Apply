class Order < ApplicationRecord
  enum status: {
    pending: 'pending',
    in_progress: 'in_progress',
    finished: 'finished'
  }

  validates :description, uniqueness: { message: 'with that name already exists.' }

  validates(:status, {
    inclusion: {
      in: ['pending'],
      message: 'A new order must be in pending status.',
    },
    on: :create
  })

  validate :update_status, if: -> { status_changed? }, on: :update

  def update_status
    return if (status_was == 'pending' && status == 'in_progress')

    return if (status_was == 'in_progress' && status == 'finished')

    errors.add :status, "cannot update."
  end
end

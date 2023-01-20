class Order < ApplicationRecord
  enum status: { 
    pending: 'pending', 
    in_progess: 'in_progress', 
    finished: 'finished' 
  }
end

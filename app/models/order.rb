class Order < ApplicationRecord
  enum status: { 
    pending: 'pending', 
    in_progress: 'in_progress', 
    finished: 'finished' 
  }
end

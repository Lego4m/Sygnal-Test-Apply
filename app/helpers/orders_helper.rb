module OrdersHelper
  def get_select_disabled_options(status)
    case status
    when 'pending'
      []
    when 'in_progress'
      ['pending']
    when 'finished'
      ['pending', 'in_progress']
    end
  end
end

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

  def get_check_box_colors(status)
    case status
      when 'pending'
        "accent-gray-500 text-gray-500 border-gray-500"
      when 'in_progress'
        "accent-orange-500 text-orange-500 border-orange-500"
      when 'finished'
        "accent-green-500 text-green-500 border-green-500"
    end
  end
end

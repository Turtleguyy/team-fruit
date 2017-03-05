module ApplicationHelper

  def last_week
    start_of_week = Date.today.last_week.beginning_of_day
    end_of_week   = start_of_week + 1.week

    start_of_week..end_of_week
  end

  def this_week
    start_of_week = Date.today.beginning_of_week.beginning_of_day
    end_of_week   = start_of_week + 1.week

    start_of_week..end_of_week
  end

end

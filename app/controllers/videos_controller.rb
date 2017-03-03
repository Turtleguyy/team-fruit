class VideosController < ApplicationController

  def index
    start_of_week = Date.today.last_week.beginning_of_day
    end_of_week   = start_of_week + 1.week

    @videos   = Video.where(published_at: start_of_week..end_of_week)
    @featured = @videos.order(:view_count).limit(1).first
  end

end

class VideosController < ApplicationController

  def index
    @videos   = Video.where(published_at: helpers.last_week)
    @featured = @videos.order(:view_count).limit(1).first

    if cookies[:apple]
      user = cookies[:apple]
      vote = Vote.where user_id: user, created_at: helpers.this_week
      @chosen_one = vote.last.try :video
    end
  end

end

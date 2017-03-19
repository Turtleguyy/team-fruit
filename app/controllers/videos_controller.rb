class VideosController < ApplicationController

  def index
    @videos   = Video.where(published_at: helpers.last_week)
    @featured = Video.where(is_featured: true)
      .order(updated_at: :desc).limit(1).first

    if @featured.blank?
      @featured = Video.order(view_count: :desc).limit(1).first
    end

    if cookies[:apple]
      user = cookies[:apple]
      vote = Vote.where user_id: user, created_at: helpers.this_week
      @chosen_one = vote.last.try :video
    end

    @cookies_ok = cookies[:banana]
  end

  def show
    @video = Video.find params[:id]
    render @video
  end

  def share_cookies
    cookies[:banana] = true
    render partial: 'hide_cookies'
  end

end

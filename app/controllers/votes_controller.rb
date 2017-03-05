require 'securerandom'

class VotesController < ApplicationController

  def create
    if cookies[:apple]
      user = cookies[:apple]
      vote = Vote.where user_id: user, created_at: helpers.this_week
      vote.first.try :destroy
    else
      cookies[:apple] = SecureRandom.uuid
    end

    vote = Vote.create({
      user_id: cookies[:apple],
      video_id: params[:video]
    })

    render vote
  end

end

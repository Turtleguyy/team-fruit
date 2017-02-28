class VideosController < ApplicationController

  def index
    channel = Yt::Channel.new url: 'https://www.youtube.com/user/MyMisterFruit'
    @latest = channel.videos.first

    @recent = []
    channel.videos.each do |video|
      if video.published_at > Date.today.at_beginning_of_week
        @recent.push(video)
      end
    end
  end

end

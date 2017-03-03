namespace :videos do
  desc "Get last weeks videos and create records for them."
  task weekly_refresh: :environment do
    channel = Yt::Channel.new url: 'https://www.youtube.com/user/MyMisterFruit'
    channel.videos.each do |video|
      if video.published_at > Date.today.at_beginning_of_week - 1.week
        Video.create({
          embed_html: video.embed_html,
          published_at: video.published_at,
          thumbnail_url: video.thumbnail_url,
          title: video.title,
          view_count: video.view_count,
          youtube_id: video.id
        })
      end
    end
  end

end

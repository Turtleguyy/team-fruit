namespace :videos do
  desc "Get last weeks videos and create records for them."
  task weekly_refresh: :environment do
    channel = Yt::Channel.new url: 'https://www.youtube.com/user/MyMisterFruit'
    channel.videos.each do |video|
      if video.published_at > Date.today.at_beginning_of_week - 1.week
        Video.create({
          description: video.description,
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

  task tally_votes: :environment do
    start_of_week = Date.today.last_week.beginning_of_day
    end_of_week   = start_of_week + 1.week
    last_week     = start_of_week..end_of_week

    featured = { video: nil, votes: 0 }
    votes    = Vote.where(created_at: last_week)

    votes.group_by(&:video_id).each do |video_id, votes|
      if video_id && votes.size > featured[:votes]
        featured[:video] = video_id
        featured[:votes] = votes.size
      end
    end

    video = Video.find featured[:video]
    video.is_featured = true
    video.save
  end

end

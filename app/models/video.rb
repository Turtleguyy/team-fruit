class Video < ApplicationRecord

  validates_uniqueness_of :youtube_id

end

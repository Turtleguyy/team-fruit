class Video < ApplicationRecord

  validates_uniqueness_of :youtube_id

  has_many :votes, dependent: :destroy

end

class Song < ApplicationRecord
  belongs_to :artist

  def self.song_count
    count
  end
end

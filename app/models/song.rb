class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  belongs_to :artist

  has_many :playlist_songs
  has_many :playlists, through: :playlist_songs

  def self.sorted_songs(songs)
    songs.order(title: :asc)
  end

end

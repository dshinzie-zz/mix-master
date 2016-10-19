class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true

  belongs_to :artist

  def self.sorted_songs(songs)
    songs.order(title: :asc)
  end
end

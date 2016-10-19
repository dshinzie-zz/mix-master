require 'rails_helper'

RSpec.feature "User deletes a song" do
  scenario "they delete from an artist's song index" do
    artist = create(:artist)
    song = create(:song)

    visit artist_songs_path(artist)
    click_on "Delete"

    expect(page).to have_current_path (artist_songs_path(artist))
    expect(page).not_to have_content(song.title)
  end
end

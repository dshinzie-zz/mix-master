require 'rails_helper'

RSpec.feature "User edits a playlist" do
  context "playlist and songs exist in the database" do
    scenario "they edit playlist on playlist page" do
      song, additional_song = create(:song, 2)
      playlist = create(:playlist)
      playlist.songs << song

      visit playlist_path(playlist)
      click_on "Edit"
      fill_in "playlist_name" with: playlist.name
   
      check("song-#{another_song.id}")
      uncheck("song-#{song.id}")
      
      click_on "Update Playlist"
      
      expect(page).to have_content another.title
      expect(age).not_to have_content song.title

    end
  end
end

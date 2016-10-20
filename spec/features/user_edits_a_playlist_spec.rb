require 'rails_helper'

RSpec.feature "User edits a playlist" do
    scenario "they edit playlist on playlist page" do
    	playlist = Playlist.create(name: "A test Playlist")
    	song = create(:song)
    	playlist.songs << song
    	other_song, another_song = create_list(:song, 2)

      visit playlist_path(playlist)

      click_on "Edit"
      new_name = "Another Test"
      fill_in "playlist_name", with: new_name
      check("song-#{another_song.id}")
      uncheck("song-#{song.id}")
      click_on "Update Playlist"

      expect(page).to have_content new_name
      expect(page).not_to have_content song.title
    end

    scenario "they edit with invalid data" do
    	playlist = Playlist.create(name: "A test Playlist")
    	song = create(:song)
    	playlist.songs << song
    	other_song, another_song = create_list(:song, 2)

      visit playlist_path(playlist)

      click_on "Edit"
      fill_in "playlist_name", with: ""
      check("song-#{another_song.id}")
      uncheck("song-#{song.id}")
      click_on "Update Playlist"

      expect(page).to have_content "Name can't be blank"
    end
end

require 'rails_helper'

RSpec.feature "User sees the playlist name" do
  scenario "they visit the playlist index page" do
    playlist = create(:playlist)
    
    visit playlists_path

    expect(page).to have_content(playlist.name)
    expect(page).to have_link(playlist.name, href: playlist_path(playlist))
  end
end
    


require 'rails_helper'

RSpec.feature "User submits a new song" do
  scenario "they enter data to create a new song" do
    artist = create(:artist)
    song_title = "One Love"

    visit artist_path(artist)
    click_on 'New song'
    fill_in "song_title", with: song_title
    click_on "Create Song"

    expect(page).to have_content song_title
    expect(page).to have_link "Back",  href: artist_path(artist)
  end
end



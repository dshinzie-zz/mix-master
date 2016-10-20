require 'rails_helper'

RSpec.feature "User submits a new song" do
  scenario "they enter data to create a new song" do
    artist = create(:artist)
    song = artist.songs.create(title: "What is Love?")
    new_song_title = "I hate vim"

    visit song_path(song)
    click_on 'Edit'
    fill_in "song_title", with: new_song_title
    click_on "Update Song"

    expect(page).to have_content new_song_title
    expect(page).to have_link "Back", href: artist_path(artist)
  end

  scenario "they edit with invalid data" do
    artist = create(:artist)
    song = artist.songs.create(title: "What is Love?")

    visit song_path(song)
    click_on 'Edit'
    fill_in "song_title", with: ""
    click_on "Update Song"

    expect(page).to have_content "Title can't be blank"
  end
end

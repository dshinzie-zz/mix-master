require 'rails_helper'

RSpec.feature 'User deletes an artist' do
  scenario "they delete an existing artist" do
    artist_name = "Nefarius III"
    image_path = "test.jpg"
    artist = Artist.create(name: artist_name, image_path: image_path)

    visit "/artists/#{artist.id}"
    click_on 'Delete'

    expect(page).to have_current_path ('/artists')
    expect(page).not_to have_content(artist_name)
  end
end

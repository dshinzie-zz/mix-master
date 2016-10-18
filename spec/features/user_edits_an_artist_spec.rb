require 'rails_helper'

RSpec.feature "User edits an artist" do
  scenario "they edit an existing artist" do
    new_artist_name = 'Jimmy Johns'
    new_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
    artist = Artist.create(name: new_artist_name, image_path: new_image_path)

    visit "/artists/#{artist.id}"
    click_on 'Edit'
    fill_in 'artist_name', with: new_artist_name
    click_on "Update Artist"

    expect(page).to have_content new_artist_name
    expect(page).to have_css("img[src=\"#{new_image_path}\"]")
  end
end

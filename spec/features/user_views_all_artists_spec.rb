require 'rails_helper'

RSpec.feature "User sees the artist name" do
  scenario "they visit the artists page" do
    artist = Artist.create(name: "Jimmy", image_path: "test")
    link = "/artists/#{artist.id}"

    visit '/artists'
    expect(page).to have_content artist.name
    expect(page).to have_link(artist.name, href: link)
  end
end

require 'rails_helper'

RSpec.feature "User creates song without title" do
  scenario "they see a blank title error" do
    artist = create(:artist) 
    error = "Title can't be blank"

    visit artist_path(artist)
    click_on 'New song'
    click_on "Create Song"

    expect(page).to have_content error
  end
end

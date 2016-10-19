require 'rails_helper'

RSpec.feature "User visits individual artist page" do
  scenario "they click view songs" do
    artist = create(:artist)
    song = artist.songs.create(title: "What is love1?")
    song2 = artist.songs.create(title: "What is love2?")
    song3 = artist.songs.create(title: "What is love3?")
    
    visit artist_path(artist)
    click_on "View songs"
    
    expect(page).to have_link "Back", href: artist_path(artist)
    expect(page).to have_selector("li:first-child", :text => song.title) 
    #expect(page).to have_selector("ul li:nth-child(2)", :text => song2.title) 
    expect(page).to have_selector("li:last-child", :text => song3.title) 
  end
end

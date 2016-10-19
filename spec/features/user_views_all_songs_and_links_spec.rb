require 'rails_helper'

RSpec.feature "User visits songs page" do
  scenario "they view all songs" do
    song = Song.create(title: "What is love1?")
    song2 = Song.create(title: "What is love2?")
    song3 = Song.create(title: "What is love3?")
    
    visit songs_path
    
    expect(page).to have_selector("li:first-child", :text => song.title) 
    #expect(page).to have_selector("ul li:nth-child(2)", :text => song2.title) 
    expect(page).to have_selector("li:last-child", :text => song3.title) 

    expect(page).to have_link song.title, href: song_path(song)
    expect(page).to have_link song2.title, href: song_path(song2)
    expect(page).to have_link song3.title, href: song_path(song3)
  end
end

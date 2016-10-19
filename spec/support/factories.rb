FactoryGirl.define do
  factory :artist do |f|
    name 
    image_path "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
  end

  factory :song do
    title
    artist
  end

  factory :playlist do
    name "My Playlist"
  end
  
  sequence :name do |n|
    "#{n} Artist"
  end

  sequence :title, ["A", "C", "B"].cycle do |n|
    "#{n} Title"
  end

end

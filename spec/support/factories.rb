FactoryGirl.define do
  factory :artist do |f|
    sequence(:name) { |n| "Class #{n}" }
    image_path "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
  end

  factory :song do |f|
    sequence(:title) { |n| "Class #{n}" }
    artist
  end

end

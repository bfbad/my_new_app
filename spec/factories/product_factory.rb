FactoryGirl.define do
  sequence(:name) { |n| "product#{n}"}
  factory :product do
    name
    image_url "5.jpg"
  end
end
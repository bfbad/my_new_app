FactoryGirl.define do
  sequence(:name) { |n| "product#{n}"}
  factory :product do
    name
  end
end
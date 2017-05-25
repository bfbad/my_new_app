FactoryGirl.define do
  factory :comment do
    body "kinda cool"
    rating 5
    user
    product
  end	
end
FactoryGirl.define do
  sequence(:email) { |n| "user#{n}@example.com" }
  
  factory :user do
    first_name "Joe"
    last_name "Schmoe"
    email
    password "mypasswordstinks"
    admin false
    confirmed_at Time.now
    
    factory :admin, class: User do
      admin true
    end
  
  end

end
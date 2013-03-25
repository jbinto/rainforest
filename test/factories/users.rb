# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "Matt"
    email "matt@example.org"
    password "test"
    password_confirmation "test"
  end
end

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :review do
    user { FactoryGirl.create(:user) }
    product { FactoryGirl.create(:product) }
    comment "MyText"
  end
end

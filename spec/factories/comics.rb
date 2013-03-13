# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comic do
    name "MyString"
    user nil
    finished false
    artist "MyString"
    category nil
    translator "MyString"
    publish "MyString"
    x_rated false
    under_review false
  end
end

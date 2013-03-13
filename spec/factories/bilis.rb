# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :bili do
    page nil
    user "MyString"
    content "MyText"
    x 1
    y 1
  end
end

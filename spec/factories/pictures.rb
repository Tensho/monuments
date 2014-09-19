# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :picture do
    data ""
    name "MyString"
    description "MyText"
    date "2014-09-19"
    monument nil
  end
end

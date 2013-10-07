# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :micro_goal do
    goal
    title "MyString"
    completion_date "2013-10-07"
  end
end

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :goal do
    user
    title "Factory Goal Title"
    motivation Faker::Lorem.characters(char_count = 255)
    completion_date "2013-10-07"
  end
end

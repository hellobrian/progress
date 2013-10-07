# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :proof do
    lesson "Today I learned that Rails is built with Ruby!"
    picture ""
    completed true
  end
end

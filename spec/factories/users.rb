# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
  	first_name "Brian"
  	last_name "Han"
  	email "bhan@example.com"
  	date_of_birth "1987-08-20"
  	gender "male"
  end
end

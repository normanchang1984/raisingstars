FactoryGirl.define do
  factory :profile do |f|
    f.name { Faker::Name.name }
  end
end

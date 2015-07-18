FactoryGirl.define do
  factory :proposal do |f|
    f.name { Faker::Name.name }
    f.email { Faker::Internet.email }
    f.phone { Faker::PhoneNumber.cell_phone }
    f.self_intro { Faker::Lorem.paragraph(5) }
    f.title { Faker::Lorem.word }
    f.content { Faker::Lorem.paragraph(20) }
  end
end

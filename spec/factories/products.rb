FactoryGirl.define do
  factory :product do
    title { Faker::Lorem.words(6).join(' ').titleize }
    description { Faker::Lorem.paragraph(15) }
    price { Faker::Base.numerify('##.##').to_f }
    partner { FactoryGirl.create(:partner) }
  end
end

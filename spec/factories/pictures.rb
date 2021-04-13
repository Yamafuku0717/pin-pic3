FactoryBot.define do
  factory :picture do
    text              {Faker::Lorem.sentence}
    public_private    {'非公開'}
    association :user

    after(:build) do |picture|
      picture.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end

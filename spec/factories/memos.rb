FactoryBot.define do
  factory :memo do
    info       {Faker::Lorem.sentence}
    offsetX    {111.111}
    offsetY    {222.222}
    
    association :picture

    after(:build) do |memo|
      memo.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end

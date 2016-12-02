include ActionDispatch::TestProcess

FactoryGirl.define do

  factory :message do
    body              {Faker::Pokemon.name}
    image             { fixture_file_upload Rails.root.join('spec', 'fixtures', 'dummy.jpg'), 'image/jpeg' }
    
    after(:create) do |message|
      message.groups << create(:group)
    end
  end


end

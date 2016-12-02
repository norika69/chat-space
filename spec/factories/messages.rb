include ActionDispatch::TestProcess

FactoryGirl.define do

  factory :message do
    body              {Faker::Pokemon.name}
    image             { fixture_file_upload Rails.root.join('spec', 'fixtures', 'dummy.jpg'), 'image/jpeg' }
    user_id            1
    group_id           1

    after(:create) do |message|
      message.groups << create(:group)
    end
  end


end

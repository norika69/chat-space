include ActionDispatch::TestProcess

FactoryGirl.define do

  factory :group do
    group_name    { Faker::Name.name }
    after(:create) do |group|
      group.users << create(:user)
    end
  end

end

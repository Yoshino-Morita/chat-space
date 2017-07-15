include ActionDispatch::TestProcess
  FactoryGirl.define do

    factory :message do
      body          { Faker::Lorem.sentence }
      image         { fixture_file_upload("spec/fixtures/files/sample.jpg", "image/jpg") }
      group_id      "1"
      user_id       "1"
      created_at { Faker::Time.between(2.days.ago, Time.now, :all) }
      updated_at { Faker::Time.between(2.days.ago, Time.now, :all) }
      user
      group
    end

  end

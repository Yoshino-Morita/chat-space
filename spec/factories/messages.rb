include ActionDispatch::TestProcess
  FactoryGirl.define do

    factory :message do
      body          "Hello"
      image         { fixture_file_upload("spec/fixtures/files/sample.jpg", "image/jpg") }
      group_id      "1"
      user_id       "1"
      user
      group
    end

  end

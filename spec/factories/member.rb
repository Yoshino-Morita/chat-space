include ActionDispatch::TestProcess
  FactoryGirl.define do

    factory :members do
      user  "sample_user"
      group "smaple_group"
    end

  end

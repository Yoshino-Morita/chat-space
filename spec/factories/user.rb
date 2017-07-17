include ActionDispatch::TestProcess
  FactoryGirl.define do
    pass = Faker::Internet.password(8)

    factory :user do
      name  {Faker::Name.first_name}
      email {Faker::Internet.email(name = nil) }
      password pass
      password_confirmation pass

      after(:create) do |user|
        create( :member, user: user, group: create(:group) )
      end
    end

  end

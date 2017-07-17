FactoryGirl.define do
   factory :group do
      name {Faker::Name.name}
      created_at { Faker::Time.between(2.days.ago, Time.now, :all) }
      updated_at { Faker::Time.between(2.days.ago, Time.now, :all) }
    end

  end

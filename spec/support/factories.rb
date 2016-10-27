FactoryGirl.define do
  factory :user do
    sequence :name do |n|
      "name #{n}"
    end
    sequence :password do |n|
      "hellp#{n}"
    end
  end
end

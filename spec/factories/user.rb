FactoryGirl.define do
  factory :admin, class: User do
    name 'admin'
    role 'admin'
  end

  factory :user, class: User do
    name 'admin'
    role 'user'
  end
end

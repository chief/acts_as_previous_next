FactoryGirl.define do
  factory :first_post, class: Post do
    name 'first post'
  end

  factory :second_post, class: Post do
    name 'second post'
  end
end

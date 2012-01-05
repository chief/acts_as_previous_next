FactoryGirl.define do
  factory :wc1, class: WithoutCancan do
    name 'wc1'
    position 2
  end

  factory :wc2, class: WithoutCancan do
    name 'wc2'
    position 3
  end
end

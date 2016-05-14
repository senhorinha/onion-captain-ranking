FactoryGirl.define do
  sequence(:random_score) do |n|
    @random_rankings ||= (1..100).to_a.shuffle
    @random_rankings[n]
  end

  factory :match do
    player "Captain"
    score { FactoryGirl.generate(:random_score) }
  end
end

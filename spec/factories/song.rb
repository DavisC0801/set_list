FactoryBot.define do
  factory :song do
    sequence(:title) {|n| "#{n} song"}
    sequence(:play_count) {|n| "#{n * 5}" }
    sequence(:length) {|n| "#{n * 10}"}
    artist # aimed at factory of the same name
  end
end

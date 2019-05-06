FactoryBot.define do
  factory :song do
    sequence(:title) {|n| "#{n} song"}
    sequence(:play_count) { "#{n * 5}" }
    length(:length) { "#{n * 10}"}
    artist # aimed at factory of the same name
  end
end

FactoryBot.define do
  factory :song do
    title {"Vampries are Posers"}
    play_count { 100 }
    length { 456 }
    artist # aimed at factory of the same name
  end
end

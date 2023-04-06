FactoryBot.define do
  factory :game do
    name { Faker::Game.title }
    genre { Faker::Game.genre }
    developer { Faker::Company.name }
    platform { Faker::Game.platform }
    box_image { Faker::Avatar.image }
    story_only { Faker::Number.number(digits: 2) }
    story_plus { Faker::Number.number(digits: 2) }
    full_completion { Faker::Number.number(digits: 2) }
    metacritic_score { Faker::Number.number(digits: 2) }
    steam_app_id { Faker::Number.number(digits: 6) }
    playstion_id {}
    nintendo_id {}
    xbox_id {}
  end
end

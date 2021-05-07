1.upto(20) do |i|
  User.find_or_create_by(email: "test#{i}@entershare.jp") do |user|
    user.password = 'password'
    user.password_confirmation = 'password'
  end
end

30.times do
  Game.create!(
    title: Faker::Games::Pokemon.name,
    text: Faker::Games::Pokemon.move
  )
end

rankings_list = []
User.all.ids.sort.each do |user_id|
  game = Game.ids.sample
  game2 = Game.ids.sample
  rankings_list << { title: Faker::Games::Pokemon.name, user_id: user_id, first_place_id: game,
                     second_place_id: game2 }
end
Ranking.create!(rankings_list)

puts '作った'

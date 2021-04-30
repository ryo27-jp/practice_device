30.times do |n|
  Game.create!(
    title: Faker::Games::Pokemon.name,
    text: Faker::Games::Pokemon.move
  )
end

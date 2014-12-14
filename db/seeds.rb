require 'faker'


4.times do
  Deck.create!(name: Faker::Name.name, description: Faker::Commerce.department)
end

25.times do
  Card.create(deck_id: rand(4), question: Faker::Commerce.department, answer: "now")
end


10.times do
  User.create(name: Faker::Internet.user_name, password: Faker::Internet.password(4))
end

10.times do
  Guess.create!( user_id: 1, round_id: 1, card_id: 1, correct: false)
end

# 1000.times do
# seed_guess= {
#   user_id: rand(4),
#   round_id: rand(4),
#   card_id: rand(4),
#   correct: false
# }
# Guess.create!(seed_guess)
# end

10.times do
  Round.create!( user_id: rand(4), deck_id: rand(4))
end



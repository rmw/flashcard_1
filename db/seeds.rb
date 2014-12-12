require 'faker'

3.times do
seed_decks= {
  name: "uhh",
  description:  "states"
}

Deck.create!(seed_decks)


10.times do
  User.create(name: Faker::Internet.user_name, password: Faker::Internet.password(4))

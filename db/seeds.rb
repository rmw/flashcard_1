require 'faker'

3.times do
seed_decks= {
  name: Faker::Name.name ,
  description:  Faker::Commerce.department
}
Deck.create!(seed_decks)
end

10.times do
seed_cards= {
  question: Faker::Name.name ,
  answer:  Faker::Commerce.department,
  deck_id: rand(4)
}
Card.create!(seed_cards)
end

test_guess= {
  user_id: 1,
  round_id: 1,
  card_id: 1,
  correct: false
}
Guess.create!(test_guess)

1000.times do
seed_guess= {
  user_id: rand(4),
  round_id: rand(4),
  card_id: rand(4),
  correct: false
}
Guess.create!(seed_guess)
end

10.times do
seed_rounds= {
  user_id: rand(4),
  deck_id: rand(4)

}
Round.create!(seed_rounds)
end

10.times do
  User.create(name: Faker::Internet.user_name, password: Faker::Internet.password(4))
end





#Card.create(deck_id: Deck.all.sample, )

require 'faker'

Deck.create!(name: "World Capitals", description: "Learn the capital for each country in the world.")


Card.create(deck_id: 1, question: "Afghanistan" , answer: "Kabul" )
Card.create(deck_id: 1, question: "Albania" , answer: "Tirana" )
Card.create(deck_id: 1, question: "Algeria", answer: "Algiers" )
Card.create(deck_id: 1, question: "Andorra", answer: "Andorra la Vella" )
Card.create(deck_id: 1, question: "Angola", answer: "Luanda" )
Card.create(deck_id: 1, question: "Antigua and Barbuda", answer: "St. Johns")


User.create(name: "Nodira", password: "corgi")





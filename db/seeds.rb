require 'faker'

Deck.create!(name: "World Capitals", description: "Learn the capital for each country in the world.")


Card.create(deck_id: 1, question: "China" , answer: "Beijing" )
Card.create(deck_id: 1, question: "India" , answer: "New Delhi" )
Card.create(deck_id: 1, question: "Japan", answer: "Tokyo" )
Card.create(deck_id: 1, question: "Russia", answer: "Moscow" )
Card.create(deck_id: 1, question: "South Korea", answer: "Seoul" )
Card.create(deck_id: 1, question: "Tajikistan", answer: "Dushanbe")


User.create(name: "Nodira", password: "corgi")
User.create(name: "Nirag", password:"taco")
User.create(name: "Armando", password:"pretzelburrito")
User.create(name: "Vianney", password:"insectmaster")





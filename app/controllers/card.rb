get '/cards/new/:id' do
  @deck = Deck.find(params[:id])
  erb :'cards/new'
end

post '/cards/:id' do
  @deck = Deck.find(params[:id])
  @new_card = Card.create(deck_id: @deck.id, question: params[:card][:question], answer: params[:card][:answer])
  redirect "/decks/#{@deck.id}"
end

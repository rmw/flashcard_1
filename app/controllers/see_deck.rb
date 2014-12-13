get '/decks' do
  @decks = Deck.all
  erb :'decks/index'
end

get '/decks/play/:id' do
  @decks = Deck.find(params[:id])
  erb :'decks/play'
end




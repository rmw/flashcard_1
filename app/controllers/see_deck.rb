get '/decks' do
  @decks = Deck.all
  erb :'decks/index'
end

get '/decks/play/:id' do
  @decks = Deck.find(params[:id])
  erb :'decks/play'
end

post '/answer/:id' do
  @deck = Deck.find(params[:id])
  p params
  @deck.right_wrong(params[:user_answer])
  redirect "/decks/play/#{@deck.id}"
end



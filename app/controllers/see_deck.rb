get '/decks' do
  if session[:user_id]  != nil
    @decks = Deck.all
    erb :'decks/index'
  else
    redirect '/login'
  end
end

get '/decks/:id' do
  if session[:user_id]  != nil
    @decks = Deck.find(params[:id])
    @cards = @decks.cards
    erb :'decks/show'
  else
    redirect '/login'
  end
end

post '/answer/:id' do
  if session[:user_id]  != nil
    @deck = Deck.find(params[:id])
    @deck.right_wrong(params[:user_answer])
    redirect "/decks/play/#{@deck.id}"
  else
    redirect '/login'
  end
end

get '/decks/play/:id' do
  if session[:user_id]  != nil
  @decks = Deck.find(params[:id])
  @cards = @decks.cards
  @round = Round.create(deck_id: @decks.id, user_id:1)
  @used = []
  erb :'decks/play'
  else
    redirect '/login'
  end

end

# get '/decks/:id' do
#   @deck = Deck.find(params[:id])
#   @card = @deck.cards.to_a.shift
#   erb :'decks/toy'
# end

# get '/decks/:deck_id/card/:card_id' do
#   @deck = Deck.find(params[:deck_id])
#   # @card = @deck.cards.shift.find(params[:card_id])
#   # @deck.cards.shift = get another card
#   # @card = Card.find_by(deck_id: params(:deck_id))

#   erb :'/decks/toy'
# end


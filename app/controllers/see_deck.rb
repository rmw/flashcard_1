get '/decks' do
  if session[:user_id] != nil
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

get '/decks/:id/round' do
  # card_arr = []
  @deck = Deck.find(params[:id])
  @round = Round.create(deck_id: @deck.id)
  @card = @deck.cards.sample
  # card_arr << @card
  erb :'/decks/playtoy'
end

get '/round/:id/correct' do
  @round = Round.find(params[:id])
  @deck = @round.deck
  erb :'/decks/correct'
end

post '/decks/round/:round_id' do
  @round = Round.find(params[:round_id])
  @deck = @round.deck
  @card = @deck.cards.first
  if params[:answer] == @card.answer
    @guess = Guess.create(correct: true, card_id: @card.id)
    # add to 1 to the card index
    redirect "/round/#{@round.id}/correct"
  else
    redirect "/decks/#{@deck.id}/round" # add card index num to url
  end
  # /decks/round
# @deck.cards[params[:index]]
#



  # redirect to round results page when card index +1 = to the length
  # of cards array

  # @deck = Deck.find(params[:id])
  # @card = @deck.cards.to_a.shift
  # @guess = Guess.create(answer: params[:answer])
end

# original play route
# get '/decks/:id/round' do
#   if session[:user_id]  != nil
#   @decks = Deck.find(params[:id])
#   @cards = @decks.cards
#   @round = Round.create(deck_id: @decks.id, user_id:1)
#   @used = []
#   erb :'decks/play'
#   else
#     redirect '/login'
#   end
# end


# get '/decks/:deck_id/card/:card_id' do
#   @deck = Deck.find(params[:deck_id])
#   # @card = @deck.cards.shift.find(params[:card_id])
#   # @deck.cards.shift = get another card
#   # @card = Card.find_by(deck_id: params(:deck_id))

#   erb :'/decks/toy'
# end


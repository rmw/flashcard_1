get '/decks' do
  if session[:user_id] != nil
    @decks = Deck.all
    erb :'decks/index'
  else
    redirect '/login'
  end
end

get '/decks/:deck_id/cards/:index_id' do
  @index = params[:index_id]
  @deck = Deck.find(params[:deck_id])
  @card = @deck.cards[params[:index_id].to_i]
  erb :'/decks/playtoy'
end

get '/decks/:id' do
  if session[:user_id]  != nil
    @deck = Deck.find(params[:id])
    @cards = @deck.cards
    erb :'decks/show'
  else
    redirect '/login'
  end
end

get '/results' do
  session[:round_id].clear
end

get '/round/:id/correct' do
  @round = Round.find(params[:id])
  @deck = @round.deck
  erb :'/decks/correct'
end

post '/decks/:deck_id/cards/:index_id' do
  @user = User.find(session[:user_id])
  @index = params[:index_id].to_i

  if @index == 0
    @round = Round.create(deck_id: params[:deck_id], user_id: @user.id)
    session[:round_id] = @round.id
  else
    @round = Round.find(session[:round_id])
  end

  @deck = @round.deck
  @card = @deck.cards[params[:index_id].to_i]

  if params[:index_id].to_i + 1 < @deck.cards.length
    if params[:answer] == @card.answer
      @guess = Guess.create(correct: true, card_id: @card.id)
      redirect "/decks/#{@deck.id}/cards/#{params[:index_id].to_i + 1}"
    else
      @error =  "You're wrong! Try again."
      erb :'/decks/playtoy'
    end
  else
    redirect "/results"
  end
end






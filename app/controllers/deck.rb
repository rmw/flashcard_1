get '/decks' do
  @user = User.find(session[:user_id])
  if session[:user_id] != nil
    @decks = Deck.all
    erb :'decks/index'
  else
    redirect '/login'
  end
end

get '/decks/:deck_id/cards/:index_id' do
  if session[:user_id] != nil

    @index = params[:index_id]
    @deck = Deck.find(params[:deck_id])
    @card = @deck.cards[params[:index_id].to_i]
    erb :'/decks/play'
   else
    redirect '/login'
  end
end

get '/decks/new' do
  erb :'decks/new'
end

post '/decks' do
  @new_deck = Deck.new(params[:deck])
  @new_deck.save

  if @new_deck.save
    redirect '/decks'
  else
    redirect '/decks/new'
  end
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



post '/decks/:deck_id/cards/:index_id' do
   if session[:user_id] != nil

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


  if @index + 1 <= @deck.cards.length
      @guess = Guess.create(card_id: @card.id, round_id: @round.id, user_id: @user.id, answer:params[:answer])
    if params[:answer].downcase == @card.answer.downcase
      @guess.correct= true
      @guess.save
    end
  end

  if @index + 1 != @deck.cards.length
    redirect "/decks/#{@deck.id}/cards/#{params[:index_id].to_i + 1}"
  else
    redirect "/rounds/#{@round.id}"
  end
  else
    redirect '/login'
  end
end






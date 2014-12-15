get'/rounds' do
   if session[:user_id] != nil

      @rounds = Round.all
      erb :'/rounds/index'
  else
    redirect '/login'
  end
end



get '/rounds/:id' do
  if session[:user_id] != nil

    @round = Round.find(session[:round_id])
    @guesses = Guess.where(round_id: @round.id)
    @correct = Guess.where(round_id: @round.id, correct: true)
    erb :'rounds/results'
   else
    redirect '/login'
  end
end

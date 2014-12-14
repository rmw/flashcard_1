get'/rounds' do
  @rounds = Round.all

  erb :'/rounds/index'


end


get '/rounds/:id' do
  @round = Round.find(session[:round_id])
  @guesses = Guess.where(round_id: @round.id)
  @correct = Guess.where(round_id: @round.id, correct: true)
  erb :'rounds/results'
end

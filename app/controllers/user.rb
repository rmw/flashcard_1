get '/login' do
  erb :'login/index'
end

post '/login' do
  if @user = User.find_by(name: params[:user][:name], password: params[:user][:password])
    if @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect '/decks'
    end
  else
    redirect '/users/new'
  end
end

get '/users/new' do
  erb :'/users/new'
end

post '/users' do
  @user = User.new(params[:user])

  if @user.save
     session[:user_id] = @user.id
    redirect '/decks'
  else
    redirect '/login/new'
  end
end

put '/login' do
  session.clear
  redirect '/login'
end

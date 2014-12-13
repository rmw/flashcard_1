get '/' do
  erb :'index'
end

get '/session/new' do
  erb :'login/index'
end

post '/session' do
  @user = User.find_by(name: params[:user][:name])
  if @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect '/decks'
  else
    redirect '/login/new'
  end
end

get '/users/new' do
  erb :'/users/new'
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    redirect '/decks'
  else
    redirect '/login/new'
  end
end


get '/' do
  erb :'index'
end

get '/login' do
  erb :'login/index'
end

post '/login' do
  @user = User.find_by(name: params[:user][:name])
  if @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect '/decks'
  else
    redirect '/login'
  end
end

get '/login/new' do
  erb :'/login/new'
end

post '/login/new' do
  @user = User.new(params[:user])
  if @user.save
    erb :'index'
    redirect '/decks'
  else
    redirect '/login/new'
  end
end

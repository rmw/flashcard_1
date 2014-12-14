get '/' do
  erb :'index'
end

get '/login' do
  erb :'login/index'
end

# get '/session-viewer' do
#   session.inspect
# end

post '/login' do
  if @user = User.find_by(name: params[:user][:name])
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
    # erb :'index'
    redirect '/decks'
  else
    redirect '/login/new'
  end
end

put '/login' do
  session.clear
  redirect '/login'
end

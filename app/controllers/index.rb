get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/sign_up' do
 
  erb :sign_up
end

get '/sign_out' do
  session.clear
  redirect ('/')
end

get '/secret' do
  if session[:user_id]
    erb :secret 
  else
    erb :index
  end
end

post '/sign_up' do
  @user = User.new(params[:user])
  @user.save!
  redirect('/')
end

post '/sign_in' do
  @user = User.authenticate(params[:email], params[:password])
  session[:user_id] = @user.id
  redirect('/')
end
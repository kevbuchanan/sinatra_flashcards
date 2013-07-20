enable :sessions

get '/logout' do
  session[:user_id] = 1
  redirect to ('/')
end

post '/login' do
  @user = User.authenticate(params[:user][:email], params[:user][:password])
  @user ||= User.find(1)
  if @user.valid?
    @user.save
    session[:user_id] = @user.id
    redirect to ('/')
  else
    @errors = "Invalid Login"
    erb :index
  end
end

post '/logout' do
  session[:user_id] = 1
  redirect to('/')
end



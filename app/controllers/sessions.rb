enable :sessions


post 'users/new/' do

end


post '/login' do
  @user = User.authenticate(params[:user][:email], params[:user][:password])
  if @user.valid?
    @user.save
    session[:user_id] = @user.id
    redirect to('/')
  else
    @errors = "Invalid Login"
    erb :index
  end
end

post '/logout' do
  session[:user_id] = 1
  redirect to('/')
end



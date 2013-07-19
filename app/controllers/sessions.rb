enable :sessions

post '/login' do
  @user = User.authenticate(params[:user][:email], params[:user][:password])
  if @user.valid?
    @user.save
    session[:user_id] = @user.id
    redirect to('/')
  else
    erb :sign_in
  end
end

post '/logout' do
  sessions[:user_id] = 1
  redirect to('/')
end



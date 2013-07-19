get '/users/:id' do
  @user = User.find(params[:id])
end

get '/users/create' do
  erb :create_user
end

get '/users/:id/edit' do
  if session[:user_id] == params[:id]
    @user = User.find(params[:id])
    erb :edit_user
  else
    redirect to('/')
  end
end

post 'users/create/' do
  @user = User.new(params[:user])
  if @user.valid?
    @user.save
    session[:user_id] = @user.id
    redirect to ("/users/#{@user.id}")
  else
    erb :create_user
  end
end

post 'users/:id/edit' do 
  @user = User.find(params[:id])
  @user.update_attributes(params[:user])
  redirect to("/users/#{@user.id}")
end



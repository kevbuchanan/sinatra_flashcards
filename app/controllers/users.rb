get '/users/create' do
  erb :"user/create"
end

get '/users/:id/edit' do
  if session[:user_id] == params[:id]
    @user = User.find(params[:id])
    erb :"user/edit"
  else
    redirect to('/')
  end
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :"user/show"
end

post '/users/create' do
  @user = User.new(params[:user])
  if @user.valid?
    @user.save
    session[:user_id] = @user.id
    redirect to ("/users/#{@user.id}")
  else
    erb :"user/create"
  end
end

post '/users/:id/edit' do
  @user = User.find(params[:id])
  @user.assign_attributes(params[:user])
  if @user.valid?
    @user.save
    redirect to("/users/#{@user.id}")
  else
    erb :"user/edit"
  end
end



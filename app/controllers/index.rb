get '/' do
  # Look in app/views/index.erb
  # by default, need guest user (user.id = 1)
  erb :index
end

post '/login' do
  "Set current_user if user/password valid \
  rerender index for current_user"
  redirect to :/
end

get '/signup' do
  "Sign up Page"
end

get '/deck/:id' do
  # get flashcards by id
  # @deck = Deck.find(params[:id])

  @deck = Deck.find(params[:id])
  erb :"deck/show"
end

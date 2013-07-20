get '/' do
  @decks = Deck.all
  session[:user_id] = 1 unless logged_in?
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

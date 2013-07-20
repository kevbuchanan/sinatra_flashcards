get '/' do
<<<<<<< HEAD
  # Look in app/views/index.erb
  session[:user_id] = 1 unless logged_in? # by default, need guest user (user.id = 1)
=======
  @decks = Deck.all
  session[:user_id] = 1 unless logged_in?
>>>>>>> 2d14ef3fbdb3cd80e0e5f2f7f8d0eebb56b2386d
  erb :index
end

get '/deck/:id' do
  # get flashcards by id
  # @deck = Deck.find(params[:id])

  @deck = Deck.find(params[:id])
  erb :"deck/show"
end

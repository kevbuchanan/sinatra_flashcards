get '/' do
  @decks = Deck.all
  session[:user_id] = 1 unless logged_in?
  erb :index
end

get '/deck/:id' do
  # get flashcards by id
  # @deck = Deck.find(params[:id])

  @deck = Deck.find(params[:id])
  erb :"deck/show"
end

get '/' do
  # Look in app/views/index.erb
  session[:user_id] = 1 unless logged_in? # by default, need guest user (user.id = 1)
  erb :index
end

get '/deck/:id' do
  # get flashcards by id
  # @deck = Deck.find(params[:id])

  @deck = Deck.find(params[:id])
  erb :"deck/show"
end

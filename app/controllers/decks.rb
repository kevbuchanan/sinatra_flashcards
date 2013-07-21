get '/deck/create' do
  erb :"deck/create"
end

get '/deck/create/:id' do
  @deck = Deck.find(params[:id])
  erb :"deck/add_cards"
end

get '/deck/:id/addcard' do
  @deck = Deck.find(params[:id])
  erb :"card/_create", layout: !request.xhr?, locals: {deck: @deck}
end

get '/deck/:id' do
  @deck = Deck.find(params[:id])
  erb :"deck/show"
end

post '/deck/create' do
  params[:deck][:user_id] = current_user.id
  @deck = Deck.create(params[:deck])
  redirect to("/deck/create/#{@deck.id}")
end

post '/deck/:id/addcard' do
  @deck = Deck.find(params[:id])
  @card = Card.create(params[:card])
  @deck.cards << @card
  if request.xhr?
    erb :"card/_show", layout: false, locals: {card: @card}
  else
    redirect to("/deck/create/#{@deck.id}")
  end
end

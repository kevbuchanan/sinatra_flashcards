# Round#create
get '/round/new/deck/:deck_id' do
  # always a current user. (id = 1 is guest_user)
  round = Round.create(deck_id: params[:deck_id], user_id: current_user.id )

  redirect redirect to :"/round/#{round.id}"
end

get '/round/:round_id' do
  @round = Round.find(params[:round_id])
  @deck = @round.deck
  erb :"round/show"
end

get '/round/:round_id/card' do
  @round = Round.find(params[:round_id])
  @card = @round.next_card
  if @card
    erb :"round/play"
  else
    erb :"round/finished"
  end
end

get '/round/:round_id/guess' do
  @round = Round.find(params[:round_id])
  @guess = @round.guesses.last
  erb :"round/guess"
end

post '/round/:round_id/get_card' do
  redirect to "/round/#{params[:round_id]}/card"
end

post '/round/:round_id/:card_id' do
  card = Card.find(params[:card_id])
  correct = card.answer == params[:guess]
  Guess.create(user_input: params[:guess], round_id: params[:round_id], card_id: params[:card_id], correct: correct)
  redirect to("/round/#{params[:round_id]}/guess")
end



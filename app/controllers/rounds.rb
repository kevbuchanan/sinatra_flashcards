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

post '/round/:round_id/get_card' do
  redirect to "/round/#{params[:round_id]}/card/:correct"
end

post '/round/:round_id/:card_id' do
  card = Card.find(params[:card_id])
  correct = params[:guess] == card.answer
  Guess.create(user_input: params[:guess], round_id: params[:round_id], card_id: params[:card_id], correct: correct)
  redirect to("/round/#{params[:round_id]}/card/#{correct ? 1 : 0}")
end

get '/round/:round_id/card/:correct' do
  @round = Round.find(params[:round_id])
  @card = @round.next_card
  @last_guess = params[:correct]
  if @card
    erb :"round/guess"
  else
    erb :"round/finished"
  end
end

# Round#create
get '/round/new/deck/:deck_id' do
  # always a current user. (id = 1 is guest_user)
  round = Round.create(deck_id: params[:deck_id], user_id: current_user.id )

  redirect redirect to(:"/round/#{round.id}")
end

get '/round/:round_id' do
  @round = Round.find(params[:round_id])
  erb :"round/show"
end

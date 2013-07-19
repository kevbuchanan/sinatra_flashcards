require 'faker'

my_deck = []

10.times do |i|
  my_deck << Card.create( question: "Why Not Zoidberg?", answer: "cause", deck_id: 1)
end

Deck.create(title: "Russian_Quiz", user_id: 1, cards: my_deck)

# create Guest User
User.create(name:"Guest", email:"guest@example.com", password:"guest", password_confirmation:"guest")




# User.create(name:"Kevin the Gray", password:"7", password_confirmation: "7")

# Round.create(deck_id: 1)

# 10.times do |i|
#   Guess.create(user_input: (i <= 6) ? "cause" : "")
# end







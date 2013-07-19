class Round < ActiveRecord::Base
  belongs_to :user
  belongs_to :deck
  delegate :cards, to: :deck
  has_many :guesses, dependent: :destroy
end
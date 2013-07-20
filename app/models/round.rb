class Round < ActiveRecord::Base
  belongs_to :user
  belongs_to :deck
  delegate :cards, to: :deck
  has_many :guesses, dependent: :destroy

  def percentage_correct
    (self.cards.size.to_f)/ (self.guesses.count * 100).round
  end
  
  def next_card
    cards = self.cards.reject do |card|
      self.guesses.where('correct = ?', true).map(&:card_id).include?(card.id)
    end
    cards.first
  end
end

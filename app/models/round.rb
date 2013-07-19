class Round < ActiveRecord::Base
  belongs_to :user
  belongs_to :deck
  delegate :cards, to: :deck
  has_many :guesses, dependent: :destroy

  def percentage_correct
    ((self.guesses.where('correct = ?', true).count / self.cards.size.to_f) * 100).round
  end
  
end

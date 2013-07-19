class CreateCardsAndDecks < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.references :deck
      t.string     :answer
      t.string     :question
      t.timestamps
    end

    create_table :decks do |t|
      t.references :user
      t.string     :title
      t.timestamps
    end
  end
end

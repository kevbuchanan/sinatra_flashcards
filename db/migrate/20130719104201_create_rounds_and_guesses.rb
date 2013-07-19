class CreateRoundsAndGuesses < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.references :user
      t.references :deck
      t.integer    :number_correct
      t.timestamps
    end

    create_table :guesses do |t|
      t.references :round
      t.boolean    :correct, default: false
      t.timestamps
    end
  end
end

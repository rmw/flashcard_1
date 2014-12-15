class CreateGuesses < ActiveRecord::Migration
 def change
    create_table :guesses do |t|
      t.boolean :correct, :default => false
      t.references :user
      t.references :round
      t.references :card
      t.string :answer

      t.timestamps
    end
  end
end

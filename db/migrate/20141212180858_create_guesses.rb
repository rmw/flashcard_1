class CreateGuesses < ActiveRecord::Migration
  def change
    create_table
      t.boolean :correct
      t.references :user
      t.references :round
      t.references :card
  end
end

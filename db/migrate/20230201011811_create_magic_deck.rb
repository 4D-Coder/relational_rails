class CreateMagicDeck < ActiveRecord::Migration[5.2]
  def change
    create_table :magic_decks do |t|
      t.string :name
      t.string :format
      t.integer :minimum_card_count
      t.boolean :qualifies
      t.timestamps
    end
  end
end

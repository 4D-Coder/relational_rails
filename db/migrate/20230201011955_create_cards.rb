class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.references :magic_deck, index: true, foreign_key: true
      t.string :name
      t.integer :mana_cost
      t.string :card_type
      t.string :archtype
      t.string :rarity
      t.string :power_toughness
      t.string :expansion
      t.boolean :legal
      t.timestamps
    end
  end
end

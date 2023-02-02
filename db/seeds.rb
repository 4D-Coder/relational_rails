# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

MagicDeck.destroy_all
Card.destroy_all

#decks
magic_deck_1 = MagicDeck.create!(name: "Cycle of Death", format: "Standard", minimum_card_count: 60, qualifies: true )
magic_deck_2 = MagicDeck.create!(name: "Treasury", format: "Historic", minimum_card_count: 60, qualifies: true )
magic_deck_3 = MagicDeck.create!(name: "Newest Vampires", format: "Commander", minimum_card_count: 100, qualifies: true )

#cards (deck_1)
card_1 = Card.create!(name: "Henrika Domnathi", mana_cost: 4, card_type: "Legendary Creature", archtype: "Vampire", rarity: "MR", power_toughness: "1/3", expansion: "VOW", legal: true, magic_deck_id: 1)
card_2 = Card.create!(name: "Necroduality", mana_cost: 4, card_type: "Enchantment", rarity: "MR", expansion: "VOW", legal: true, magic_deck_id: 1)
card_3 = Card.create!(name: "Diabolic Intent", mana_cost: 2, card_type: "Sorcery", rarity:"R", expansion: "BRO", legal: true, magic_deck_id: 1)


#cards (deck_2)
card_1 = Card.create!(name: "Old Gnawbone", mana_cost: 7, card_type: "Legendary Creature", archtype: "Dragon", rarity: "MR", power_toughness: "7/7", expansion: "AFR", legal: true, magic_deck_id: 2)
card_2 = Card.create!(name: "Goldspan Dragon", mana_cost: 5, card_type: "Creature", archtype: "Dragon", rarity: "MR", power_toughness: "4/4", expansion: "KHM", legal: true, magic_deck_id: 2)
card_3 = Card.create!(name: "You Happen On a Glade", mana_cost: 3, card_type: "Instant", rarity: "UC",  expansion: "AFR", legal: true, magic_deck_id: 2)

#cards (deck_3)
card_1 = Card.create!(name: "Edgar, Charmed Groom", mana_cost: 4, card_type: "Legendary Creature", archtype: "Vampire Noble", rarity: "R", power_toughness: "4/4", expansion: "VOW", legal: true, magic_deck_id: 3)
card_2 = Card.create!(name: "Drana, the Last Bloodcheif", mana_cost: 5, card_type: "Legendary Creature", archtype: "Vampire Cleric", rarity: "MR", power_toughness: "4/4", expansion: "ZNR", legal: true, magic_deck_id: 3)
card_3 = Card.create!(name: "Champion of Dusk", mana_cost: 5, card_type: "Creature", archtype: "Vampire Knight", rarity: "R", power_toughness: "4/4", expansion: "VOC", legal: true, magic_deck_id: 3)
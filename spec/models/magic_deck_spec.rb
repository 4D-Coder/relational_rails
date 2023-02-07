require 'rails_helper'

RSpec.describe MagicDeck, type: :model do
  before do
    @treasury = MagicDeck.where(name: "Treasury")
    @cycle_of_death = MagicDeck.where(name: "Cycle of Death")
    @newest_vampires = MagicDeck.where(name: "Newest Vampires")
  end

  describe 'child relationship' do 
    it {should have_many :cards}
  end
end
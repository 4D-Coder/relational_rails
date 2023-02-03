require 'rails_helper'

RSpec.describe MagicDeck, type: :model do
  it {should have_many :cards}
end
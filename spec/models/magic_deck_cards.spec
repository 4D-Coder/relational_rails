require 'rails_helper'

RSpec.describe MagicCards type: :model do
  it {should belong_to :magic_deck}
end

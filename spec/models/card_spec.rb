require 'rails_helper'

RSpec.describe Card, type: :model do
  it {should belong_to :magic_deck}
end
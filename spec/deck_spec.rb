require 'deck'

RSpec.describe Deck do
  describe "#shuffle!" do
    let(:deck) { Deck.new }
    let!(:original_cards) { deck.cards.dup }
    let(:shuffled_cards) { deck.shuffle! }

    it 'shuffles the cards' do
      expect(shuffled_cards).not_to eq(original_cards)
    end
  end
end
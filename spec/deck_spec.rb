require 'deck'

RSpec.describe Deck do
  describe "#shuffle!" do
    let!(:original_cards) { Deck.cards.dup }
    let(:shuffled_cards) { Deck.shuffle! }

    it 'shuffles the cards' do
      expect(shuffled_cards).not_to eq(original_cards)
    end
  end
end
class Deck
  class << self
    def shuffle!
      CARDS.shuffle!
    end

    def cards
      CARDS
    end

    private

    CARDS = [
      ["10", "Clubs"],
      ["10", "Diamonds"],
      ["10", "Hearts"],
      ["10", "Spades"],
      ["J", "Clubs"],
      ["J", "Diamonds"],
      ["J", "Hearts"],
      ["J", "Spades"],
      ["Q", "Clubs"],
      ["Q", "Diamonds"],
      ["Q", "Hearts"],
      ["Q", "Spades"],
      ["K", "Clubs"],
      ["K", "Diamonds"],
      ["K", "Hearts"],
      ["K", "Spades"],
      ["A", "Clubs"],
      ["A", "Diamonds"],
      ["A", "Hearts"],
      ["A", "Spades"]
    ]
  end
end

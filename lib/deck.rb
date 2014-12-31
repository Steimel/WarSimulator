class Deck
  attr_reader :cards

  def initialize
    @cards = []
  end

  def add_to_deck(card)
    @cards.push(card)
  end

  def pop_from_deck
    @cards.shift
  end

  def shuffle
    @cards.shuffle!
  end

  def empty?
    size == 0
  end

  def size
    @cards.size
  end

  def self.create_full_deck
    deck = Deck.new
    (2..14).each do |value|
      4.times do
        deck.add_to_deck(Card.new(Face.new(value)))
      end
    end
    deck.shuffle
    deck
  end

  def self.deal_decks(full_deck)
    deck1 = Deck.new
    deck2 = Deck.new
    until full_deck.empty?
      deck1.add_to_deck(full_deck.pop_from_deck)
      deck2.add_to_deck(full_deck.pop_from_deck) unless full_deck.empty?
    end
    return [deck1, deck2]
  end

end
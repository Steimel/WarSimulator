class Game
  attr_reader :deck1, :deck2, :winner, :rounds, :wars

  def initialize
    @deck1, @deck2 = Deck::deal_decks(Deck::create_full_deck)
    @winner = 0
    @rounds = 0
    @wars = 0
  end

  def run
    until finished?
      play_round
    end
  end

  def play_round
    @rounds += 1
  end

  def finished?
    true
  end

end
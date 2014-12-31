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

    card1 = @deck1.pop_from_deck
    card2 = @deck2.pop_from_deck

    result = card1.compare(card2)
    if result > 0
      @deck1.add_to_deck(card1)
      @deck1.add_to_deck(card2)
    elsif result < 0
      @deck2.add_to_deck(card1)
      @deck2.add_to_deck(card2)
    else
      @wars += 1
      #TODO war
    end

    @winner = 1 if @deck2.empty?
    @winner = 2 if @deck1.empty?
  end

  def finished?
    @winner != 0
  end

end
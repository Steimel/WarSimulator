class Game
  attr_reader :deck1, :deck2, :winner, :rounds, :wars

  def initialize(options = {})
    @deck1, @deck2 = Deck::deal_decks(Deck::create_full_deck)
    @deck1.game = self
    @deck2.game = self
    @winner = 0
    @rounds = 0
    @wars = 0
    @options = options
    @options[:shuffle_winnings] = true unless @options.has_key?(:shuffle_winnings)
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

    cards_to_win = [card1, card2]

    result = card1.compare(card2)

    while result == 0
      @wars += 1
      stuck = true

      4.times do
        unless @deck1.empty?
          stuck = false
          card1 = @deck1.pop_from_deck
          cards_to_win.push(card1)
        end
        unless @deck2.empty?
          stuck = false
          card2 = @deck2.pop_from_deck
          cards_to_win.push(card2)
        end
      end

      if stuck
        puts 'Game stuck in infinite war'
        @winner = -1
        return
      end

      result = card1.compare(card2)
    end

    if result > 0
      @deck1.add_set_to_deck(cards_to_win)
    elsif result < 0
      @deck2.add_set_to_deck(cards_to_win)
    end

    @winner = 1 if @deck2.empty?
    @winner = 2 if @deck1.empty?
  end

  def finished?
    @winner != 0
  end

  def shuffle_winnings
    @options[:shuffle_winnings] === true
  end

end
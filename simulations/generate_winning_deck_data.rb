require_relative '../lib/war_simulator'

output_path = File.dirname(__FILE__) + '/data/winning_decks.txt'

num_games = ARGV.first.nil? ? 10000 : ARGV.first.to_i
winning_decks = []

num_games.times do
  game = Game.new(:shuffle_winnings => true)
  deck1 = game.deck1.dup
  deck2 = game.deck2.dup
  game.run
  if game.winner == Game::WINNER_PLAYER_1
    winning_decks.push(deck1)
  elsif game.winner == Game::WINNER_PLAYER_2
    winning_decks.push(deck2)
  end
end

File.open(output_path, 'a') do |f|
  winning_decks.each do |deck|
    f.puts deck.cards.map{|card| card.face.value.to_s }.join(',')
  end
end
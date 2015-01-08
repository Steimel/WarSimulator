require_relative '../lib/war_simulator'

output_path = 'data/number_of_rounds.txt'

num_games = 100000
rounds = []

num_games.times do
  game = Game.new(:shuffle_winnings => true)
  game.run
  if game.winner == Game::WINNER_PLAYER_1 || game.winner == Game::WINNER_PLAYER_2
    rounds.push(game.rounds)
  end
end

puts 'Games played: ' + num_games.to_s
puts 'Max rounds in a finished game: ' + rounds.max.to_s
puts 'Average number of rounds per finished game: ' + (rounds.reduce(:+).to_f / rounds.size.to_f).to_s

File.open(output_path, 'a') do |f|
  rounds.each do |r|
    f.puts r
  end
end
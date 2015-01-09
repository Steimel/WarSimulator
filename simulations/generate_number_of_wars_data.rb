require_relative '../lib/war_simulator'

output_path = File.dirname(__FILE__) + '/data/number_of_wars.txt'

num_games = ARGV.first.nil? ? 10000 : ARGV.first.to_i
wars = []

num_games.times do
  game = Game.new(:shuffle_winnings => true)
  game.run
  if game.winner == Game::WINNER_PLAYER_1 || game.winner == Game::WINNER_PLAYER_2
    wars.push(game.wars)
  end
end

puts 'Games played: ' + num_games.to_s
puts 'Max wars in a finished game: ' + wars.max.to_s
puts 'Average number of wars per finished game: ' + (wars.reduce(:+).to_f / wars.size.to_f).to_s

File.open(output_path, 'a') do |f|
  wars.each do |w|
    f.puts w
  end
end
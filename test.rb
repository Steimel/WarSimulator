require_relative 'lib/war_simulator'

num_games = 10000
num_stuck = 0
num_finished = 0
total_rounds_finished = 0
max_rounds_finished = 0

num_games.times do
  game = Game.new(:shuffle_winnings => true)
  game.run
  if game.winner == Game::WINNER_INFINITE_ROUNDS
    num_stuck += 1
  elsif game.winner == Game::WINNER_PLAYER_1 || game.winner == Game::WINNER_PLAYER_2
    num_finished += 1
    total_rounds_finished += game.rounds
    max_rounds_finished = game.rounds if game.rounds > max_rounds_finished
  end
end

puts 'Games played: ' + num_games.to_s
puts 'Games stuck: ' + num_stuck.to_s
puts 'Percent stuck: ' + (num_stuck.to_f / num_games.to_f).to_s
puts 'Games finished: ' + num_finished.to_s
puts 'Percent finished: ' + (num_finished.to_f / num_games.to_f).to_s
puts 'Max rounds in a finished game: ' + max_rounds_finished.to_s
puts 'Average number of rounds per finished game: ' + (total_rounds_finished.to_f / num_finished.to_f).to_s
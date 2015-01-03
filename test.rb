require_relative 'lib/war_simulator'

100.times do |x|
  game = Game.new
  game.run
  puts x.to_s + '|' + game.winner.to_s + '|' + game.rounds.to_s
end
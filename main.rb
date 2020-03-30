require_relative 'players'
require_relative 'questions'
Player1 =  Player.new('Player 1')
Player2 = Player.new('Player 2')

@players = [Player1, Player2]

@current_player_num = 0

def change_player
  @current_player_num = ( @current_player_num + 1 ) % (2)
  @current_player = @players[@current_player_num]
end

def turn(current_player)
  q = Question.new
  puts "#{current_player.name}: #{q.question}"

  print "> "
  input = gets.chomp

  if input.to_i == q.answer
    puts "#{current_player.name}: YES! You are correct."
  else
    puts "#{current_player.name}: NO! You are incorrect."
    current_player.lose_life
  end
end

loop do
  if Player1.game_over
    puts "Player 2 wins with a score of #{Player2.lives}/3 \n----- GAME OVER ----- \nGood Bye!"
    break
  end

  if Player2.game_over
    puts "Player 1 wins with a score of #{Player1.lives}/3 \n----- GAME OVER ----- \nGood Bye!"
    break
  end

  turn(@players[@current_player_num])
  puts "P1: #{Player1.lives}/3 vs P2: #{Player2.lives}/3"
  puts "----- NEW TURN -----"
  change_player
end
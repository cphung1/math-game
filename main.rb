require_relative 'players'
require_relative 'questions'
player1 =  Player.new('Player 1')
player2 = Player.new('Player 2')

@players = [player1, player2]

@current_player_num = 0

def turn
  @current_player_num = ( @current_player_num + 1 ) % (2)
  @current_player = @players[@current_player_num]
end

while @players[0].lives != 0 && @players[1].lives != 0
  a = Question.new
  puts "#{@players[@current_player_num].name}: #{a.question}"
  print "> "
  p1_input = gets.chomp

  if p1_input.to_i == a.answer
    puts "#{@players[@current_player_num].name}: YES! You are correct."
    puts "P1: #{@players[0].lives}/3 vs P2: #{@players[1].lives}/3"
    puts "----- NEW TURN -----"
  else 
    puts "#{@players[@current_player_num].name}: Seriously? No!"
    @players[@current_player_num].lose_life
    puts "P1: #{@players[0].lives}/3 vs P2: #{@players[1].lives}/3"
    puts "----- NEW TURN -----"
  end
  
  turn
end 

if @players[0].lives == 0 || @players[1].lives == 0
  if @players[0].lives != 0 
    puts "#{@players[0].name} wins with a score of #{@players[0].lives}/3"
    puts "----- GAME OVER -----"
    puts "Good bye!"
  end
  if @players[1].lives != 0 
    puts "#{@players[1].name} wins with a score of #{@players[1].lives}/3"
    puts "----- GAME OVER -----"
    puts "Good bye!"
  end
end
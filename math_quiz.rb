require './player'
require './question'

class MathQuiz

  def self.main
    game = MathQuiz.new
    game.start
  end

  def initialize
    @players = [
      Player.new('Player 1'),
      Player.new('Player 2')
    ]
    @number_of_players = 2    
    @current_player = 0

  end

  

  def start
    greet_players
    until game_over? do
      puts "Are you ready #{current_player.name}?"
      gets
      current_question = Question.new
      puts "#{current_player.name}: #{current_question.question}"
      @answer = gets.chomp.to_i
      if current_question.correct? @answer
        puts "#{current_player.name}: Dude, you're a math genius!"
      else
        current_player.lose_a_point
        puts "#{current_player.name}: Get a math tutor!"
      end
      swap_players
      print_scores
    end
      
        puts "#{current_player.name} wins with a score of #{current_player.point}/3"
        puts '----- GAME OVER -----'
  end
end
    

  

  

  def current_player
    @players[@current_player] 
  end

  def game_over?
    @players.any? { |player| player.point == 0 }  
  end

  def swap_players
    @current_player = (@current_player + 1) % @players.length
  end

  def greet_players
    @players.each do |player|
      puts "Hello #{player.name}"
      puts 'Would you like to change your name? (y/N) '
      if gets.chomp == 'y'
        puts 'Enter your new name: '
        player.name = gets.chomp
        puts "Your new name is: #{player.name}"
      end
    end
  end

  def print_scores
    @players.each do |player|
      puts "#{player.name} has #{player.point} /3"
    end
  end



MathQuiz.main

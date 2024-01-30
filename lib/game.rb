
require_relative './player'

class Game
  class << self
    attr_accessor :player_1, :player_2, :deck
  
    def play
      @player_1, @player_2 = set_players
  binding.pry    
      # yield unless set_players


      # - ESTA MAL llamando 2 veces set_players
      deck.shuffle!
    end
  
    private
  
    def set_players
      p_1 = Player.new
      p_2 = Player.new
      register_names!(p_1, p_2)

      [p_1, p_2]
    end
  
    def register_names!(p_1, p_2)
      puts "CLUTCH"
      puts "-" * 72
      puts "Register player names before starting the game"
      print "Name? "
      name_1 = gets.chomp
      print "Name? "
      name_2 = gets.chomp
      puts "Confirm names? (Y/N)"
      puts "-" * 72

      case confirmed_names
      when "Y"
        p_1.name = name_1
        p_2.name = name_2
      else
        return
      end
    end
  
    def confirmed_names
      loop do
        confirmation = gets.chomp.capitalize
    
        if %w[Y N].include?(confirmation)
          return confirmation
        else
          puts "Incorrect input, please type 'Y' or 'N'"
        end
      end
    end
  end
end
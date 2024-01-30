require_relative './player'
require_relative './deck'

class Game
  class << self
    attr_accessor :player_1, :player_2, :deck
  
    def play
      @player_1, @player_2 = set_players
      @deck = Deck.shuffle!
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

      case confirm_names
      when "Y"
        p_1.name = sanitize_name(name_1, "Player 1")
        p_2.name = sanitize_name(name_2, "Player 2")
      else
        return
      end
    end

    def sanitize_name(name, player)
      while name.empty? do
        puts "#{player} name can't be empty, please add a new name"
        name = gets.chomp
      end

      name
    end
  
    def confirm_names
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
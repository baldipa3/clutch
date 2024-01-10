require 'pry'

class GameInterface
  def start
    # @statistics = Statistics.new

    print_options

    select_option
  end

  def print_options
    puts "CLUTCH"
    puts "---------------------"
    puts "1 - GAME"
    puts "2 - STATISTICS"
    puts "3 - CREDITS"
    puts "---------------------"
    puts "0 - EXIT"
  end

  def select_option
    option = gets.chomp

    case sanitize_option(option)
    when 1
      game
    when 2
      statistics
    when 3
      credits
    when 0
      return
    end

    rescue ArgumentError
      puts "Selected option is invalid, valid options are 0, 1, 2, 3"
      
      select_option
  end

  def game
    Game.play(@statistics)
  end

  def statistics
    @statistics.show
  end

  def credits
    Credit.show
  end

  private

  def sanitize_option(option)
    transformed_option = Integer(option)

    unless (0..3).include?(transformed_option)
      raise ArgumentError
    end

    option
  end
end
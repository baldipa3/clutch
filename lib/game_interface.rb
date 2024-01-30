require 'pry'
require_relative './game'
require_relative './statistics'
require_relative './credits'

class GameInterface
  def start
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

  def select_option(attempts = 0)
    return if attempts >= MAX_ATTEMPTS

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
      attempts += 1
      puts "Selected option is invalid, valid options are 0, 1, 2, 3"
      puts "You have #{MAX_ATTEMPTS - attempts} attempts left"
      
      select_option(attempts)
  end
  
  private

  # def main_menu
  #   self.start
  # end

  def game
    Game.play
  end

  def statistics
    Statistics.show
  end

  def credits
    Credits.show
  end

  def sanitize_option(option)
    transformed_option = Integer(option)

    unless (0..3).include?(transformed_option)
      raise ArgumentError
    end

    transformed_option
  end

  MAX_ATTEMPTS = 3
end
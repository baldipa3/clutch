class Dice
  def self.roll
    FACES.sample
  end

  private
  
  FACES = [1, 2, 3, 4, 5, 6]
end
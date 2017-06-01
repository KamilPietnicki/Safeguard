require 'gosu'

require_relative 'lib/player'

class Game < Gosu::Window
  def initialize
    super 1000, 540
    self.caption = "Gosu"
    
    @background_image = Gosu::Image.new("img/background.jpg", :tileable => true)

    @music = Gosu::Song.new(self, "music/initial.mp3")
    @music.volume = 0.25
    @music.play(true)

    @player = Player.new
    @player.warp(1000, 540)
  end
  
  def update
    if Gosu.button_down? Gosu::KB_LEFT or Gosu::button_down? Gosu::GP_LEFT
      @player.turn_left
    end
    if Gosu.button_down? Gosu::KB_RIGHT or Gosu::button_down? Gosu::GP_RIGHT
      @player.turn_right
    end
    if Gosu.button_down? Gosu::KB_UP or Gosu::button_down? Gosu::GP_BUTTON_0
      @player.accelerate
    end
    @player.move
  end
  
  def draw
    @player.draw
    @background_image.draw(0, 0, 0)
  end

  def button_down(id)
    if id == Gosu::KB_ESCAPE
      close
    else
      super
    end
  end
end

Game.new.show
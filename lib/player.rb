class Player
  def initialize
    @image = Gosu::Image.new("img/turtle.png")
    @x = @y = @vel_x = @vel_y = @angle = 0.0
    @score = 0
  end

  def warp(x, y)
    @x, @y = x, y
  end
  
  def turn_left
    @angle -= 3
  end
  
  def turn_right
    @angle += 3
  end
  
  def accelerate
    @vel_x += Gosu.offset_x(@angle, 0.025)
    @vel_y += Gosu.offset_y(@angle, 0.025)
  end
  
  def move
    @x += @vel_x
    @y += @vel_y
    @x %= 1000
    @y %= 540
    
    @vel_x *= 1
    @vel_y *= 1
  end

  def draw
    @image.draw_rot(@x, @y, 1, @angle)
  end
end
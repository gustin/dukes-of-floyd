class Elcamino < Jemini::GameObject
  attr_accessor :movement_rate
  SLOW_SPEED = 0.1
  NORMAL_SPEED = 0.5
  EDGE_OF_LEFT_ROAD = 208.0
  EDGE_OF_RIGHT_ROAD = 549.0
  EDGE_OF_LEFT_SCREEN = 29.0
  has_behavior :DrawableImage
  has_behavior :HandlesEvents

  def load
    self.image = :elcamino
    @movement_rate = NORMAL_SPEED
    elcamino = self
    handle_event :move_left do |message|
      puts position
      if position.x > EDGE_OF_LEFT_SCREEN
        position.x -= elcamino.movement_rate * message.delta 
      end
      if position.x <= EDGE_OF_LEFT_ROAD
       elcamino.movement_rate = SLOW_SPEED
      end
      if on_road(position.x) 
        elcamino.movement_rate = NORMAL_SPEED
      end
    end
    handle_event :move_right do |message|
      puts position
      if position.x < self.game_state.screen_size.x
        position.x += elcamino.movement_rate * message.delta
      end  
      if position.x >= EDGE_OF_RIGHT_ROAD
        elcamino.movement_rate = SLOW_SPEED
      end
      if on_road(position.x)
        elcamino.movement_rate = NORMAL_SPEED
      end
    end
  end
   
   def on_road(position_x) 
     if (position_x > EDGE_OF_LEFT_ROAD) and (position_x < EDGE_OF_RIGHT_ROAD)
       return true 
     end
   end
end


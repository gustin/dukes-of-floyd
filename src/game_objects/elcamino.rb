class Elcamino < Jemini::GameObject
  attr_accessor :movement_rate
  attr_accessor :road

  SLOW_SPEED = 0.1
  NORMAL_SPEED = 0.5
  EDGE_OF_LEFT_ROAD = 199.0
  EDGE_OF_RIGHT_ROAD = 578.50
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
       road.movement_rate = Road::SLOW_SPEED 
      end
      if position.x > EDGE_OF_LEFT_ROAD
        elcamino.movement_rate = NORMAL_SPEED
        road.movement_rate = Road::NORMAL_SPEED
      end
    end
    handle_event :move_right do |message|
      puts position
      if position.x < self.game_state.screen_size.x
        position.x += elcamino.movement_rate * message.delta
      end  
      if position.x >= EDGE_OF_RIGHT_ROAD
        elcamino.movement_rate = SLOW_SPEED
        road.movement_rate = Road::SLOW_SPEED
      end
      if position.x < EDGE_OF_RIGHT_ROAD
        elcamino.movement_rate = NORMAL_SPEED
        road.movement_rate = Road::NORMAL_SPEED
      end
    end
  end
end


class Elcamino < Jemini::GameObject
  attr_accessor :movement_rate
  EDGE_OF_LEFT_SCREEN = 29.0
  has_behavior :DrawableImage
  has_behavior :HandlesEvents

  def load
    self.image = :elcamino
    @movement_rate = 0.5 
    handle_event :move_left do |message|
      if position.x > EDGE_OF_LEFT_SCREEN
        position.x -= @gameobject.movement_rate * message.delta 
        puts position
      end
      if position.x == 299.0 
       @game_object.movement_rate = 0.1   
      end
    end
    handle_event :move_right do |message|
      if position.x < self.game_state.screen_size.x
        position.x += @movement_rate * message.delta
        puts position
      end  
      if position.x == 472.5 
       @movement_rate = 0.0
      end
    end
  end
end


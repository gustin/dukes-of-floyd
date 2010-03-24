class Elcamino < Jemini::GameObject
  MOVEMENT_RATE = 0.5 
  has_behavior :DrawableImage
  has_behavior :HandlesEvents

  def load
    self.image = :elcamino
    handle_event :move_left do |message|
      if position.x > 29.0 
        position.x -= MOVEMENT_RATE * message.delta 
      end  
    end
    handle_event :move_right do |message|
      if position.x < self.game_state.screen_size.x
        position.x += MOVEMENT_RATE * message.delta
      end
    end
  end
  
end


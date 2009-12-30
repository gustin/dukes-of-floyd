class Truck < Jemini::GameObject
  MOVEMENT_RATE = 0.5 
  has_behavior :DrawableImage
  has_behavior :HandleEvents

  def load
    self.image = :truck
    handle_event :move_left do |message|
      position.x -= MOVEMENT_RATE * message.delta 
    end
    handle_event :move_right do |message|
      position.x += MOVEMENT_RATE * message.delta
    end
  end
end

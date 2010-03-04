class Road < Jemini::GameObject
  MOVEMENT_RATE = 0.5 
  has_behavior :DrawableImage
  has_behavior :HandlesEvents
  has_behavior :Movable 

  def load
    self.image = :road

    self.move(0, -0.5)
  end
end

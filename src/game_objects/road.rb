class Road < Jemini::GameObject
  MOVEMENT_RATE = 0.5 
  has_behavior :DrawableImage
  has_behavior :HandlesEvents
  has_behavior :Movable 

  def load
    self.image = :road
    handle_event :start_engine do |message|
      self.move(0, -0.5)
    end
    handle_event :stop_engine do |message|
      self.move(0, -0.0)
    end
  end

  def whats_up
    puts 'yo yo'
  end

end

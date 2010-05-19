class Road < Jemini::GameObject
  attr_accessor :movement_rate
  attr_accessor :road

  SLOW_SPEED  = -0.1
  NORMAL_SPEED = -0.5
  has_behavior :DrawableImage
  has_behavior :HandlesEvents
  has_behavior :Movable 

  def load
    self.movement_rate = NORMAL_SPEED
    self.image = :road
    handle_event :start_engine do |message|
      self.move(0, self.movement_rate)
    end
    handle_event :stop_engine do |message|
      self.move(0, -0.0)
    end
  end

  def whats_up
    puts 'yo yo'
  end

end

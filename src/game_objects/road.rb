class Road < Jemini::GameObject
  attr_accessor :movement_rate
  attr_accessor :play_state
  attr_accessor :animated
  attr_accessor :road

  SLOW_SPEED  = -0.1
  NORMAL_SPEED = -0.5
  has_behavior :DrawableImage
  has_behavior :HandlesEvents
  has_behavior :Movable 

  def load
    self.animated = false
    self.on_movement do |movement|
      if animated 
        self.move(0, self.movement_rate) if animated
        #puts 'position:' + self.position
        #if self.position == 30
        #  road = play_state.create :Road
        #  road.position = 0
        #end
      end
    end
    self.movement_rate = NORMAL_SPEED
    self.image = :road
    handle_event :start_engine do |message|
      self.animated = true
      self.move(0, self.movement_rate)
    end
    handle_event :stop_engine do |message|
      self.animated = false
      self.move(0, -0.0)
    end
  end

  def whats_up
    puts 'yo yo'
  end

end

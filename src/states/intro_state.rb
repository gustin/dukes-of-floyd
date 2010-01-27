class IntroState < Jemini::GameState

  def load
    create :Background, :blue_ridge_mountains
    create :Text, 'Dukes of Floyd', 
           :position => Vector.new(screen_width, screen_height).half
  end

end



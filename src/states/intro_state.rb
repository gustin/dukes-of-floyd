class IntroState < Jemini::GameState

  def load
    menu_handler = create :GameObject, :HandlesEvents
    menu_handler.handle_event(:start) { switch_state :PlayState }

    create :Background, :blue_ridge_mountains
    create :Text, 'Dukes of Floyd', 
           :position => Vector.new(screen_width, screen_height).half
  end
end


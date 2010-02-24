class PlayState < Jemini::GameState

  def load
    menu_handler = create :GameObject, :HandlesEvents
    menu_handler.handle_event(:quit) { quit_game }

    elcamino = create :Elcamino
    elcamino.position = screen_size.half 
  end

end




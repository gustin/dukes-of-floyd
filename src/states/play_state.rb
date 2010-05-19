class PlayState < Jemini::GameState
  
  def load
    set_manager :render, create(:BasicRenderManager )

    menu_handler = create :GameObject, :HandlesEvents
    menu_handler.handle_event(:quit) { quit_game }

    road = create :Road
    road.play_state = self
    road.position = screen_size.half

    elcamino = create :Elcamino
    elcamino.road = road 
    elcamino.position = screen_size.half 
  end

end




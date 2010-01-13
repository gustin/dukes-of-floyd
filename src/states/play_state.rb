class PlayState < Jemini::GameState
  def load
    elcamino = create :Elcamino
    elcamino.position = screen_size.half 
  end
end




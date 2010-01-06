class PlayState < Jemini::GameState
  def load
    truck = create :Truck
    truck.position = screen_size.half 
  end
end




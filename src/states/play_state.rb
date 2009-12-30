class PlayState < Jemini::GameState
  def load
    truck = create :Truck
    truck.position = scree_size.half 
  end
end




Jemini::InputBuilder.declare do |i|

  i.in_order_to :move_left do
    i.hold :left
  end

  i.in_order_to :move_right do
    i.hold :right
  end

  i.in_order_to :quit do
    i.release :q
  end
  
  i.in_order_to :start_engine do
    i.hold :up
  end
  
  i.in_order_to :stop_engine do
    i.hold :down
  end
 
end

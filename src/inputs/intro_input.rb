Jemini::InputBuilder.declare do |i|

  i.in_order_to :start do
	  i.release :down_arrow
  end

  i.in_order_to :quit do
	  i.release :q
  end
end

function lovr.draw(pass)
	local angle = lovr.headset.getTime()
	pass:cube(0, 1.7, -1, 0.5, angle)
end

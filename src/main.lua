function lovr.draw(pass)
	local angle = lovr.headset.getTime()

	pass:setColor(0xff00ee, 255)
	pass:cube(0, 1.7, -1, 0.5, angle)
end

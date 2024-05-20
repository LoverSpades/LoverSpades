lovr.mouse = require 'libs.mouse'

function lovr.load() end

function lovr.update(dt)
	if lovr.system.isKeyDown("w") then
		print("Hello World!")
	end
end

function lovr.draw(pass)
	local pos = lovr.math.newVec3(0, 1.7, -1)

	local scale = lovr.math.newVec3(1, 1, 1)
	local quat = lovr.math.newQuat(0, 0, 1, 0)

	local transform = lovr.math.newMat4(pos, scale, quat)

	pass:setColor(0xff00ee, 255)
	pass:cube(transform, "line")
end

local modules = peripheral.find("neuralInterface")
if not modules then
	error("Must have a neural interface", 0)
end
if not modules.hasModule("plethora:sensor") then error("Must have a sensor", 0) end
if not modules.hasModule("plethora:scanner") then error("Must have a scanner", 0) end
if not modules.hasModule("plethora:introspection") then error("Must have an introspection module", 0) end
if not modules.hasModule("plethora:kinetic", 0) then error("Must have a kinetic agument", 0) end
local meta = {}
while true do
	meta = modules.getMetaOwner()
	local mY = meta.motionY
				mY = (mY - 0.138) / 0.8

				-- If it is sufficiently large then we fire ourselves in that direction.
				if mY > 0.5 or mY < 0 then
					local sign = 1
					if mY < 0 then sign = -1 end
					modules.launch(0, 90 * sign, math.min(4, math.abs(mY)))
				else
					sleep(0)
				end
end


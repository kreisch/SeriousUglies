do
local statObj = coalition.getStaticObjects(2) 					--1 Red coalition 2 blue coalition
	for i, static in pairs(statObj) do
		local staticName = static:getName()
			if string.match(staticName, "MassRecoverCat 1.*") then
				static:destroy()				-- removes the object
			end
	end
end
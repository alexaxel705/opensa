dff = engineLoadDFF("models/lae711block01.dff")
engineReplaceModel(dff, 5418)
col = engineLoadCOL("models/lae711block01.col")
engineReplaceCOL(col, 5418)

dff = engineLoadDFF("models/laepetrol1a.dff")
engineReplaceModel(dff, 5409)
col = engineLoadCOL("models/laepetrol1a.col")
engineReplaceCOL(col, 5409)


local just_remove = {
	{ 1522, 65535, "Gen_doorSHOP3", 2105.919921, -1807.250000, 12.515600, 0.000000, 0.000000, 89.999992, 0.000000 },
}

local objects = {	
	{ 5418, 5530, "lae711block01", 2112.939941, -1797.089965, 19.335899, 0.000000, 0.000000, 0.000000, 0.000000 },
		
	{ 5409, 5535, "laepetrol1a", 1918.849975, -1776.329956, 16.976600, 0.000000, 0.000000, 0.000000, 0.000000 },
	
	{ 12853, 13245, "sw_gas01", 666.710998, -565.132995, 17.335899, 0.000000, 0.000000, 0.000000, 0.000000 },
	{ 12854, 65535, "sw_gas01int", 666.492004, -571.179992, 17.312500, 0.000000, 0.000000, 0.000000, 0.000000 },
}

-- [model] = {model, x,y,z, rx,ry,rz, scalex, scaley, doublesided}
local advObject = {
	[5418] = {
		{1522, -6.82,-8.6,-6.84, 0,0,270},
		
		{2439, 7,-7,-6.84, 0,0,270},
		{2439, 7,-8,-6.84, 0,0,270},
		{2439, 7,-9,-6.84, 0,0,270},
		{2439, 7,-10,-6.84, 0,0,270},
		{2439, 7,-11,-6.84, 0,0,270},
		{2439, 7,-12,-6.84, 0,0,270},
		
		{3851, -7,-2.3,-5.7, 0,0,0},
		{3851, -7,-16.5,-5.7, 0,0,0},
	}, 
	[5409] = {
		{1984, 8,4,-4.5, 0,0,90},
		
		{1561, 9.35,-1.8,-4.5, 0,0,90},
	}, 
	
}


local Doors = { -- offsets
	[1522] = {0,0,0,0,0,0},
	[1561] = {0,0,0,0,0,180},
	[1560] = {0,0,0,0,0,0},
	[3061] = {0,0,1.3,0,0,270},
}


function CreateDoors(model, x,y,z, rx,ry,rz)
	local Physics = createObject(1491, x,y,z, rx,ry,rz)
	local Visual = createObject(model, x,y,z, rx,ry,rz)
	setElementCollisionsEnabled(Visual, false)
	attachElements(Visual, Physics, Doors[model][1], Doors[model][2], Doors[model][3], Doors[model][4], Doors[model][5], Doors[model][6])
	setElementAlpha(Physics, 0)
	return Physics
end





function Start()
	for _, v in pairs(just_remove) do
		local model = v[1]
		local lodmodel = v[2]
		local x,y,z = v[4], v[5], v[6]
		removeWorldModel(model, 100, x,y,z)
		removeWorldModel(lodmodel, 100, x,y,z)
	end


	for _, v in pairs(objects) do
		local model = v[1]
		local lodmodel = v[2]
		local x,y,z = v[4], v[5], v[6]
		local rx, ry, rz = v[7], v[8], v[9]
		removeWorldModel(model, 100, x,y,z)
		removeWorldModel(lodmodel, 100, x,y,z)
		local obj = createObject(model, x,y,z, rx, ry, rz, false)
		local lod = createObject(lodmodel, x,y,z, rx, ry, rz, true)
		setLowLODElement(obj, lod)
		setElementDoubleSided(obj, true)
		if(advObject[v[1]]) then
			for i, dat in pairs(advObject[v[1]]) do
				local x, y, z = getPositionFromElementOffset(obj, dat[2], dat[3], dat[4])
				if(Doors[dat[1]]) then
					CreateDoors(dat[1], x, y, z, rx+dat[5], ry+dat[6], rz+dat[7])
				else
					local obj2 = createObject(dat[1], x, y, z, rx+dat[5], ry+dat[6], rz+dat[7])
					
					if(dat[8]) then
						setObjectScale(obj2, dat[8], dat[9])
					end
					
					if(dat[10]) then
						setElementDoubleSided(obj2, true)
					end
				end
			end
		end
	end
end
addEventHandler("onClientResourceStart", getResourceRootElement(), Start)



function getPositionFromElementOffset(element,offX,offY,offZ) 
    local m = getElementMatrix(element)
    local x = offX * m[1][1] + offY * m[2][1] + offZ * m[3][1] + m[4][1]
    local y = offX * m[1][2] + offY * m[2][2] + offZ * m[3][2] + m[4][2] 
    local z = offX * m[1][3] + offY * m[2][3] + offZ * m[3][3] + m[4][3] 
    return x, y, z
end 

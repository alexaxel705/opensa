dff = engineLoadDFF("models/lae711block01.dff")
engineReplaceModel(dff, 5418)
col = engineLoadCOL("models/lae711block01.col")
engineReplaceCOL(col, 5418)

dff = engineLoadDFF("models/laepetrol1a.dff")
engineReplaceModel(dff, 5409)
col = engineLoadCOL("models/laepetrol1a.col")
engineReplaceCOL(col, 5409)

dff = engineLoadDFF("models/des_ntcafe.dff")
engineReplaceModel(dff, 16012)
col = engineLoadCOL("models/des_ntcafe.col")
engineReplaceCOL(col, 16012)

dff = engineLoadDFF("models/carlshou1_lae2.dff")
engineReplaceModel(dff, 17697)
col = engineLoadCOL("models/carlshou1_lae2.col")
engineReplaceCOL(col, 17697)

dff = engineLoadDFF("models/sw_lasershop.dff")
engineReplaceModel(dff, 12944)
col = engineLoadCOL("models/sw_lasershop.col")
engineReplaceCOL(col, 12944)


local just_remove = {
	{ 1522, 65535, "Gen_doorSHOP3", 2105.919921, -1807.250000, 12.515600, 0.000000, 0.000000, 89.999992, 0.000000 },
	
	{ 1498, 65535, "Gen_doorEXT03", 2496.159912, -1691.560058, 13.757800, 0.000000, 0.000000, 179.999984, 0.000000 },	
	
	{ 17925, 65535, "carls_faux", 2493.840087, -1696.709960, 15.515600, 0.000000, 0.000000, 179.999984, 0.000000 },	
	{ 17951, 65535, "cjgaragedoor", 2505.520019, -1690.989990, 14.328100, 0.000000, 0.000000, -89.999992, 0.000000 },
}



local objects = {	
	{ 5418, 5530, "lae711block01", 2112.939941, -1797.089965, 19.335899, 0.000000, 0.000000, 0.000000, 0.000000 },
		
	{ 5409, 5535, "laepetrol1a", 1918.849975, -1776.329956, 16.976600, 0.000000, 0.000000, 0.000000, 0.000000 },
	
	{ 16012, 65535, "des_ntcafe", -264.671997, 2596.570068, 61.820301, 0.000000, 0.000000, 0.000000, 0.000000 },
	
	{ 17697, 17768, "carlshou1_LAe2", 2494.270019, -1696.209960, 17.054700, 0.000000, 0.000000, -179.999984, 0.000000 },
	
	{ 17950, 17952, "cjsaveg", 2505.59, -1695.290039, 14.695300, 0.000000, 0.000000, 0.000000, 0.000000 },
	
	{ 12944, 13257, "sw_lasershop", 2310.419921, 14.265600, 25.476600, 0.000000, 0.000000, 0.000000, 0.000000 },

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
	[16012] = {
		{3061, 9.15,5.65,-0.08, 0,0,90},
		{3061, 9.24,7.75,-0.08, 0,0,270},
		{1984, 8,0,0, 0,0,90},
	},
	[17697] = {
		{1498, -0.38,-4.6,-3.3, 0,0,180},
	},
	[12944] = {
		{2959, 6.45,-0.85,-0.33, 0,0,90},
		{2959, -5.40,-0.75,-0.21, 0,0,90},
	}
}

local Doors = { -- offsets, inverse
	[1498] = {0,0,0,0,0,0},
	
	[1522] = {0,0,0,0,0,0},
	
	[1560] = {0,0,0,0,0,0},
	[1561] = {0,0,0,0,0,180},
	
	[2947] = {0,0,0,0,0,90}, 
	[2948] = {0,0,0,0,0,90}, 
	
	[2959] = {0,0,0,0,0,270}, 
	
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
CreateDoors(2947, 2322.845, 8.304, 25.483, 0,0,270)
CreateDoors(2947, 2316.233, 0.712, 25.742, 0,0,180)


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

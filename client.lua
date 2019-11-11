local Meta = {
	"lae711block01", 
	"laepetrol1a",
	"des_ntcafe",
	"carlshou1_lae2",
	"sw_lasershop",
	"sw_block01a",
	"sw_shack02",
	"sw_bigburb_02",
	"sw_bigburb_04",
	
}

for _,name in pairs(Meta) do
	dff = engineLoadDFF("models/"..name..".dff")
	engineReplaceModel(dff, engineGetModelIDFromName(name))
	col = engineLoadCOL("models/"..name..".col")
	engineReplaceCOL(col, engineGetModelIDFromName(name))
end

local just_remove = {
	{ 1522, 65535, "Gen_doorSHOP3", 2105.919921, -1807.250000, 12.515600, 0.000000, 0.000000, 89.999992, 0.000000 },
	
	{ 1498, 65535, "Gen_doorEXT03", 2496.159912, -1691.560058, 13.757800, 0.000000, 0.000000, 179.999984, 0.000000 },	
	
	{ 17925, 65535, "carls_faux", 2493.840087, -1696.709960, 15.515600, 0.000000, 0.000000, 179.999984, 0.000000 },	
	{ 17951, 65535, "cjgaragedoor", 2505.520019, -1690.989990, 14.328100, 0.000000, 0.000000, -89.999992, 0.000000 },
	
	{ 1522, 65535, "Gen_doorSHOP3", 2331.379882, 75.804702, 25.601600, 0.000000, 0.000000, -89.999992, 0.000000 },
}



local objects = {	
	{ 5418, 5530, "lae711block01", 2112.939941, -1797.089965, 19.335899, 0.000000, 0.000000, 0.000000, 0.000000 },
		
	{ 5409, 5535, "laepetrol1a", 1918.849975, -1776.329956, 16.976600, 0.000000, 0.000000, 0.000000, 0.000000 },
	
	{ 16012, 65535, "des_ntcafe", -264.671997, 2596.570068, 61.820301, 0.000000, 0.000000, 0.000000, 0.000000 },
	
	{ 17697, 17768, "carlshou1_LAe2", 2494.270019, -1696.209960, 17.054700, 0.000000, 0.000000, -179.999984, 0.000000 },
	
	{ 17950, 17952, "cjsaveg", 2505.59, -1695.290039, 14.695300, 0.000000, 0.000000, 0.000000, 0.000000 },
	
	{ 12944, 13257, "sw_lasershop", 2310.419921, 14.265600, 25.476600, 0.000000, 0.000000, 0.000000, 0.000000 },
	
	{ 12948, 13261, "sw_block01a", 2337.800048, 71.460899, 24.492200, 0.000000, 0.000000, 0.000000, 0.000000 },
	
	{ 12991, 65535, "sw_shack02", 2161.629882, -102.476997, 1.750000, 0.000000, 0.000000, 31.333297, 0.000000 },
	
	{ 3316, 3327, "sw_bigburb_02", 2296.360107, -127.046997, 28.812500, 0.000000, 0.000000, -179.999984, 0.000000 },
	{ 3316, 3327, "sw_bigburb_02", 2195.189941, -63.320301, 28.812500, 0.000000, 0.000000, 89.999992, 0.000000 },
	{ 3316, 3327, "sw_bigburb_02", 2441.429931, -57.046901, 28.812500, 0.000000, 0.000000, -179.999984, 0.000000 },
	{ 3316, 3327, "sw_bigburb_02", 769.218994, -558.867004, 18.671899, 0.000000, 0.000000, -179.999954, 0.000000 },
	
	{ 3314, 3329, "sw_bigburb_04", 2194.760009, -92.359397, 26.468799, 0.000000, 0.000000, 89.999992, 0.000000 },
	{ 3314, 3329, "sw_bigburb_04", 2275.469970, -127.484001, 26.468799, 0.000000, 0.000000, -179.999984, 0.000000 },
	{ 3314, 3329, "sw_bigburb_04", 2370.469970, -57.476600, 26.468799, 0.000000, 0.000000, -179.999984, 0.000000 },
	{ 3314, 3329, "sw_bigburb_04", 2267.379882, 0.851562, 26.468799, 0.000000, 0.000000, 0.000018, 0.000000 },
	{ 3314, 3329, "sw_bigburb_04", 740.156005, -500.968994, 16.328100, 0.000000, 0.000000, 0.000018, 0.000000 },
	{ 3314, 3329, "sw_bigburb_04", 815.156005, -500.968994, 16.328100, 0.000000, 0.000000, 0.000018, 0.000000 },

}

local Colls = {}
-- [model] = {model, x,y,z, rx,ry,rz, scalex, scaley, doublesided}
local advObject = {
	[5418] = {
		{"ColPolygon", "The Well Stacked Pizza Co.", -10, 10, {0,0, 10.7,-25.1, -7.4,-25.1, -7.4,6, 10.7,6}}, 
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
		{"ColPolygon", "24/7", -10, 10, {0,0, 9.2,-10, -4.4,-10, -4.4,10, 9.2,10}}, 
		{1984, 8,4,-4.5, 0,0,90},
		
		{1561, 9.35,-1.8,-4.5, 0,0,90},
	}, 
	[16012] = {
		{"ColPolygon", "24/7", 0, 3, {0,0, 9,4, 10.3,4, 10.3,-4, -15,-4, -15,3.2, -16,3.2, -16,8.9, 9,8.9}}, 
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
	},
	[12948] = {
		{1522, -6.4, 2.82, 1.12, 0, 0, 90},

		{2439, -10, 0, 1.12, 0,0,180},
		{2439, -9, 0, 1.12, 0,0,180},
		{2439, -8, 0, 1.12, 0,0,180},
		
		{2948, -13.63, 5.89, 0.6, 0,0,180},
	},
	[3316] = {
		{"ColPolygon", "House For Sale", -2, 4, {0,0, -6.7,-1.7, -6.7,15.2, 1.2,15.2, 1.2,5.2, 6,5.2, 6,-1.7}}, 
		{3061, 2.1, -1.65, -2.18, 0, 0, 0},
		{3061, 1.25, 11.1, -2.18, 0, 0, 90},
		
		{5340, -2.5,-1.6,-0.8,0,0,90}
	}, 
	[3314] = {
		{"ColPolygon", "House For Sale", -2, 4, {0,0, -6.2,-7.9, -6.2,9, 1.75,9, 1.75,-1, 6.5,-1, 6.5,-7.9}}, 
		{3061, 2.6, -7.9, 0.16, 0, 0, 0},
		{3061, 1.75, 4.8, 0.16, 0, 0, 90},
		
		{3061, 9.09, 11.3, -0.43, 0, 0, 90},
	}
}		



local Doors = { -- offsets
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
	local Visual = createObject(model, Vector3())
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
				if(tonumber(dat[1])) then
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
				elseif(dat[1] == "ColPolygon") then
					local Coord = table.copy(dat[5])
					
					local ind = 1
					for i = 1, #Coord/2 do
						Coord[ind], Coord[ind+1] = getPositionFromElementOffset(obj, Coord[ind], Coord[ind+1], 0)
						ind = ind+2
					end
					local col = createColPolygon(unpack(Coord))
					setElementParent(col, obj)
					Colls[col] = {dat[2], z+dat[3], dat[4]}
				end
			end
		end
	end
end
addEventHandler("onClientResourceStart", getResourceRootElement(), Start)




function table.copy(t)
	local t2 = {};
	for k,v in pairs(t) do
		if type(v) == "table" then
			t2[k] = table.copy(v);
		else
			t2[k] = v;
		end
	end
	return t2;
end



function getPositionFromElementOffset(element,offX,offY,offZ) 
    local m = getElementMatrix(element)
    local x = offX * m[1][1] + offY * m[2][1] + offZ * m[3][1] + m[4][1]
    local y = offX * m[1][2] + offY * m[2][2] + offZ * m[3][2] + m[4][2] 
    local z = offX * m[1][3] + offY * m[2][3] + offZ * m[3][3] + m[4][3] 
    return x, y, z
end 



function math.round(number, decimals, method)
    decimals = decimals or 0
    local factor = 10 ^ decimals
    if (method == "ceil" or method == "floor") then return math[method](number * factor) / factor
    else return tonumber(("%."..decimals.."f"):format(number)) end
end



function onClientColShapeHit(theElement, matchingDimension)
	if(not matchingDimension) then return false end
	if(theElement == localPlayer) then
		if(Colls[source]) then
			local x,y,z = getElementPosition(localPlayer)
			if(z-Colls[source][2] > 0 and z-Colls[source][2] < Colls[source][3]) then
				if(Colls[source][1] == "House For Sale") then
					local Parent = getElementParent(source)
					local x,y,z = getElementPosition(Parent)
					x,y,z = math.round(x), math.round(y), math.round(z)
					local index = getElementInterior(Parent)..getElementDimension(Parent)..x..y..z
					triggerServerEvent("getBuildingOwner", localPlayer, localPlayer, index)
					bindKey("Enter", "down", BuyBuildings, index)
				else
					triggerEvent("SetZoneDisplay", localPlayer, Colls[source][1])
				end
			end
		end
	end
end
addEventHandler("onClientColShapeHit", root, onClientColShapeHit)


function onClientColShapeLeave(thePlayer, matchingDimension)
	if(not matchingDimension) then return false end
	
	if(thePlayer == localPlayer) then
		unbindKey("Enter", "down", BuyBuildings)
	end
end
addEventHandler("onClientColShapeLeave", root, onClientColShapeLeave)

function BuyBuildings(theKey, state, index)
	triggerServerEvent("buyBuilding", localPlayer, localPlayer, index)
end



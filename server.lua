local Owners = xmlLoadFile("owners.xml")

function ServerOff()
	xmlSaveFile(Owners)
	xmlUnloadFile(Owners)
end
addEventHandler("onResourceStop", getResourceRootElement(), ServerOff)



function getBuildingOwner(thePlayer, index)
	local node = xmlFindChild(Owners, "b"..index, 0)
	if(node) then
		local Owner = xmlNodeGetValue(node)
		if(Owner == getPlayerName(thePlayer)) then
			triggerClientEvent(thePlayer, "ToolTip", thePlayer, "Нажми #A0A0A0Enter #FFFFFFчтобы продать дом")
		end
		triggerClientEvent(thePlayer, "SetZoneDisplay", thePlayer, Owner.." house")
	else
		triggerClientEvent(thePlayer, "ToolTip", thePlayer, "Нажми #A0A0A0Enter #FFFFFFчтобы купить дом")
		triggerClientEvent(thePlayer, "SetZoneDisplay", thePlayer, "House For Sale")
	end
end
addEvent("getBuildingOwner", true)
addEventHandler("getBuildingOwner", root, getBuildingOwner)



function buyBuilding(thePlayer, index)
	local node = xmlFindChild(Owners, "b"..index, 0)
	if(not node) then
		local NewNode = xmlCreateChild(Owners, "b"..index)
		xmlNodeSetValue(NewNode, getPlayerName(thePlayer))
	else
		local Owner = xmlNodeGetValue(node)
		if(Owner == getPlayerName(thePlayer)) then
			xmlDestroyNode(node)
		end
	end
	getBuildingOwner(thePlayer, index)
end
addEvent("buyBuilding", true)
addEventHandler("buyBuilding", root, buyBuilding)





function OpenGarage(thePlayer, index, obj)
	local node = xmlFindChild(Owners, "b"..index, 0)
	if(node) then
		local Owner = xmlNodeGetValue(node)
		if(Owner == getPlayerName(thePlayer)) then
			outputConsole("Okidoki")

		end
	end
end
addEvent("OpenGarage", true)
addEventHandler("OpenGarage", root, OpenGarage)








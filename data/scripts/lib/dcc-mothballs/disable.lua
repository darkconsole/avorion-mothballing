
if(onServer())
then

function initialize()

	local Ship = Entity(Player().craftIndex)

	if(Ship == nil or Ship.type ~= EntityType.Ship)
	then
		print("[Mothballs] You are not currently controlling a ship.")
		return terminate()
	end

	Ship:removeScript("lib/dcc-mothballs/mothballed.lua")
	print("[Mothballs] " .. Ship.name .. " is no longer mothballed.")

	return terminate()
end

end

--[[----------------------------------------------------------------------------
AVORION: Mothballing
darkconsole <darkcee.legit@gmail.com>

This script disables the script that puts a ship in mothballs.
----------------------------------------------------------------------------]]--

if(onServer())
then

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function initialize()

	local Ship = Entity(Player().craftIndex)

	if(Ship == nil or Ship.type ~= EntityType.Ship)
	then
		print("[Mothballs] You are not currently controlling a ship.")
		return terminate()
	end

	Ship:removeScript("lib/dcc-mothballs/mothballed.lua")
	print("[Mothballs] " .. Ship.name .. " is no longer mothballed.")

	invokeClientFunction(
		Player().index,
		"displayMissionAccomplishedText",
		"Active Duty",
		Ship.name .. " now needs a full crew."
	)

	return terminate()
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

end

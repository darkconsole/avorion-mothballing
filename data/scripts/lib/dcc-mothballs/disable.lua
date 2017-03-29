--[[----------------------------------------------------------------------------
AVORION: Mothballing
darkconsole <darkcee.legit@gmail.com>

This script disables the script that puts a ship in mothballs.
----------------------------------------------------------------------------]]--

function ClientTerminate(Title,Text)
	if(onServer())
	then
		invokeClientFunction(Player(),"ClientTerminate",Title,Text)
		return
	end

	displayMissionAccomplishedText(Title,Text)
	terminate()
	return
end

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

	-- ping the client to show a message about it.
	deferredCallback(
		1, "ClientTerminate",
		"Back From Retirement",
		"The " .. Ship.name .. " now needs a full crew."
	)

	return terminate()
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

end

--[[----------------------------------------------------------------------------
AVORION: Mothballing
darkconsole <darkcee.legit@gmail.com>

This script enables the script that puts a ship in mothballs.
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
	local Script = "lib/dcc-mothballs/mothballed.lua"

	if(Ship == nil or Ship.type ~= EntityType.Ship)
	then
		print("[Mothballs] You are not currently controlling a ship.")
		return terminate()
	end

	if(not Ship:hasScript(Script))
	then
		Ship:addScript(Script)
		print("[Mothballs] " .. Ship.name .. " is now mothballed.")
	else
		print("[Mothballs] " .. Ship.name .. " is already mothballed.")
	end

	-- ping the client to show a message about it.
	deferredCallback(
		1, "ClientTerminate",
		"Mothballed",
		"The " .. Ship.name .. " is ready for a skeleton crew."
	)

	return terminate()
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

end

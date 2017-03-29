--[[----------------------------------------------------------------------------
AVORION: Mothballing
darkconsole <darkcee.legit@gmail.com>

This script enables the script that puts a ship in mothballs.
----------------------------------------------------------------------------]]--

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

	return terminate()
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

end

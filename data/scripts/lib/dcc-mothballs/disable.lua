--[[----------------------------------------------------------------------------
AVORION: Mothballing
darkconsole <darkcee.legit@gmail.com>

This script disables the script that puts a ship in mothballs.
----------------------------------------------------------------------------]]--

function initialize()

	if(onServer())
	then
		local Ship = Entity(Player().craftIndex)
		local Script = "lib/dcc-mothballs/mothballed.lua"

		if(Ship == nil or Ship.type ~= EntityType.Ship)
		then
			print("[Mothballs] You are not currently controlling a ship.")
			return terminate()
		end

		Ship:removeScript(Script)
		print("[Mothballs] " .. Ship.name .. " is no longer mothballed.")

		-- ping the client to show a message about it.
		deferredCallback(
			1, "WeDoneHereAndThere",
			"Back From Retirement",
			"The " .. Ship.name .. " now needs a full crew."
		)

		return
	end
end

function WeDoneHereAndThere(Title,Text)
	if(onServer())
	then
		invokeClientFunction(Player(),"WeDoneHereAndThere",Title,Text)
		terminate()
		return
	end

	displayMissionAccomplishedText(Title,Text)
	terminate()
	return
end

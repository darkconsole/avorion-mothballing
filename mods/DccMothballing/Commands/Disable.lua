--[[----------------------------------------------------------------------------
AVORION: Mothballing
darkconsole <darkcee.legit@gmail.com>

This script disables the script that puts a ship in mothballs.
----------------------------------------------------------------------------]]--

package.path = package.path
.. ";data/scripts/lib/?.lua"
.. ";data/scripts/sector/?.lua"
.. ";data/scripts/?.lua"

include("utility")
include("callable")

local This = {}

function initialize()

	print("[DccMothballing] Disable Command by " .. Player().index)

	if(not onServer())
	then return end

	local Ship = Entity(Player().craftIndex)
	local Script = "mods/DccMothballing/Entity/MothballedShip.lua"

	if(Ship == nil or Ship.type ~= EntityType.Ship)
	then
		print("[Mothballs] You are not currently controlling a ship.")
		return terminate()
	end

	Ship:removeScript(Script)
	print("[Mothballs] " .. Ship.name .. " is no longer mothballed.")

	-- ping the client to show a message about it.
	deferredCallback(
		1, "MothballDisable_WeDoneHereAndThere",
		"Back From Retirement",
		"The " .. Ship.name .. " now needs a full crew."
	)

	return
end

function MothballDisable_WeDoneHereAndThere(Title,Text)

	if(onServer())
	then
		invokeClientFunction(Player(),"MothballDisable_WeDoneHereAndThere",Title,Text)
		terminate()
		return
	end

	displayMissionAccomplishedText(Title,Text)
	terminate()
	return
end

callable(nil,"MothBallDisable_WeDoneHereAndThere")

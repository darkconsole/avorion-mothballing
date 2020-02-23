--[[----------------------------------------------------------------------------
AVORION: Mothballing
darkconsole <darkcee.legit@gmail.com>

This script enables the script that puts a ship in mothballs.
----------------------------------------------------------------------------]]--

package.path = package.path
.. ";data/scripts/lib/?.lua"
.. ";data/scripts/sector/?.lua"
.. ";data/scripts/?.lua"

include("utility")
include("callable")

local This = {}

function initialize()

	print("[DccMothballing] Enable Command by " .. Player().index)

	if(not onServer())
	then return end

	--------
	--------

	-- make sure the server admin successfully created the config file.

	local ConfigOK, Config = pcall(
		include,
		'mods/DccMothballing/Config'
	)

	if(not ConfigOK)
	then
		deferredCallback(
			1, "WeDoneHereAndThere",
			"Mothballs: Config.lua Error",
			"Did you remember to copy ConfigDefault.lua on the Server?"
		)
		return
	end

	--------
	--------

	local Ship = Entity(Player().craftIndex)
	local Script = "mods/DccMothballing/Entity/MothballedShip.lua"

	-- make sure we have a ship.

	if(Ship == nil or Ship.type ~= EntityType.Ship)
	then
		deferredCallback(
			1, "WeDoneHereAndThere",
			"Mothballs: No Ship",
			"You are not currently controlling a ship."
		)
		return
	end

	-- check if it is already mothballed.

	if(not Ship:hasScript(Script))
	then
		Ship:addScript(Script)
		print("[Mothballs] " .. Ship.name .. " is now mothballed.")
	else
		print("[Mothballs] " .. Ship.name .. " is already mothballed.")
	end

	-- ping the client to show a message about it.
	deferredCallback(
		1, "MothballEnable_WeDoneHereAndThere",
		"Mothballed",
		"The " .. Ship.name .. " is ready for a skeleton crew."
	)

	return
end

function MothballEnable_WeDoneHereAndThere(Title,Text)
	if(onServer())
	then
		invokeClientFunction(Player(),"MothballEnable_WeDoneHereAndThere",Title,Text)
		terminate()
		return
	end

	displayMissionAccomplishedText(Title,Text)
	terminate()
	return
end

callable(nil,"MothballEnable_WeDoneHereAndThere")

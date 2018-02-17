--[[----------------------------------------------------------------------------
AVORION: Mothballing
darkconsole <darkcee.legit@gmail.com>

This is the chat command script to provide the /mothballs command.

* /mothballs on will mothball the currently controlled ship.
* /mothballs off will bring the current ship out of mothballs.
----------------------------------------------------------------------------]]--

if(onServer())
then

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function execute(PlayerID, Command, Action, ...)

	if(Action == "on")
	then
		Player(PlayerID):addScriptOnce("mods/DccMothballing/Commands/Enable.lua")
	else
		Player(PlayerID):addScriptOnce("mods/DccMothballing/Commands/Disable.lua")
	end

	return 0, "", ""
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

end

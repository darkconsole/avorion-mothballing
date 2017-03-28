
if(onServer())
then

function execute(PlayerID, Command, Action, ...)

	if(Action == "on")
	then
		Player(PlayerID):addScriptOnce("lib/dcc-mothballs/enable.lua")
	else
		Player(PlayerID):addScriptOnce("lib/dcc-mothballs/disable.lua")
	end

	return 0, "", ""
end

end

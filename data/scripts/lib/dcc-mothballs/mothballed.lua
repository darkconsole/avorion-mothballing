--[[----------------------------------------------------------------------------
AVORION: Mothballing
darkconsole <darkcee.legit@gmail.com>

This script handles the actual mothballing, keeping the ship alive if it does
not have enough mechanics to do so on its own.
----------------------------------------------------------------------------]]--

function ClientShowMessage(Title,Text)
	displayMissionAccomplishedText(Title,Text)
	return
end

if onServer()
then

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

local Mothballs = {
	HealMult        = 1.0,  -- multiple of damage done to heal faster
	BindToMechanics = true, -- only heal if health % lower than mech %
	Debug           = true  -- show verbose messages.
};

--------------------------------------------------------------------------------

function initialize()
-- when this script is attached to a ship register for the events we need to
-- look out for.

	-- get the thing we attach to hopefully.
	local Ship = Entity()

	-- when the ship takes damage we want to know about it.
	Ship:registerCallback("onDamaged","OnDamaged")

	invokeClientFunction(
		Player(),
		"ClientShowMessage",
		"Mothballed",
		"The " .. Ship.name .. " may now be sustained with a skeleton crew."
	)

	return
end

function PrintDebug(Message)
-- print these messages if debug mode is on.

	if(Mothballs.Debug)
	then
		print("[Mothballs] " .. Message)
	end

	return
end

--------------------------------------------------------------------------------

function OnDamaged(ObjectIndex, Amount, InflictorIndex)
-- when this ship takes damage, heal it back, if it was not damage done by a
-- third party source. this will neutralize the decay the game does when there
-- are no mechanics on board.

	local Ship = Entity(ObjectIndex)

	-- i only care about self inflicted damage, that caused by not having
	-- enough mechanics.

	if(InflictorIndex ~= nil)
	then
		return
	end

	-- heal the ship for the amount of damage it took.

	PrintDebug("OnDamaged(): " .. Ship.name .. " -" .. Amount)
	Heal(Ship, Amount)

	return
end

--------------------------------------------------------------------------------

function Heal(Ship, Amount)
-- heal the ship the specified amount.

	-- the heal method currently has no info in the documentation so i took
	-- some stupid guesses and just started throwing data at it until it
	-- worked. the ship size i am sure is pointless it was just an easy valid
	-- vec3 to throw at it. probably suppose to be the targeted block.

	-- laser thinks the index may be the "block index" and the location the
	-- spot on the block where the game might spawn particles or something.
	-- seems about as plausable as any i would guess.

	local Amount = Amount * Mothballs.HealMult
	local CurrHealth = GetHealthPercent(Ship)
	local CurrMech = GetMechPercent(Ship)

	-- if enabled, only heal the ship if the ship health is lower than the
	-- percentage of required mechs on board.

	if(Mothballs.BindToMechanics)
	then
		if(CurrHealth > CurrMech)
		then
			PrintDebug("Heal(" .. Ship.name .. ") does not need healing ("..CurrHealth.."%/"..CurrMech.."%)")
			return
		end
	end

	PrintDebug("Heal(): " .. Ship.name .. " (Health: " .. CurrHealth .. "%, Mechs: " .. CurrMech .. "%) +" .. Amount)
	Ship:heal(Amount, Ship:getPlan().rootIndex, vec3(0,0,0), ObjectIndex)

	return
end

--------------------------------------------------------------------------------

function GetHealthPercent(Ship)
-- get the ship's current health percentage.

	return (Ship.durability / Ship.maxDurability) * 100
end

function GetMechPercent(Ship)
-- get the ship's current allotment of mechanics.

	return Ship:getCrewMembers(CrewProfessionType.Repair) / Ship.crew.mechanics
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

end

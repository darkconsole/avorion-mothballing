local Config = {
	-- multiple of damage done to heal faster
	HealMult        = 1.05,

	-- multiple of mechs you have. 1.0 for the actual count.
	MechMult        = 1.0,

	-- minimum mechanic performance % required. the ship will not heal at all
	-- unless it has at least this much mechanic performance onboard. a ship
	-- with no mechanics is 20% according to the game right now.
	MinMechanics    = 20.0,

	-- only heal if health % lower than mech %. if you have a 32% mechanic
	-- workforce on board, then your ship health fall and hover around
	-- 32% of its health. else it will always heal according to the HealMult
	-- as long as the minimum mechanic workforce is met.
	BindToMechanics = true,

	 -- show verbose messages
	Debug           = false
};

return Config;

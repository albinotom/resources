Config = {
	ShutdownWithEngine = false, -- Turn lights off if the engine is turned off
	ShutdownVehicleOnExit = false, -- Should we stop lights when exiting?
	Framework = "qb", -- Valid Options: qb, standalone
	DebugMode = true, -- Show debug printDebugs
	-- NineNineVolume = 0.2, -- Volume of 999mode sound, default 0.2 if not set
	KeepSirensOnExit = false, -- Should sirens stay on when the user exits
	UsingCustomSirens = {
		"DLC_LGMODS\\sirenpack_one",
		"DLC_LGMODS\\sirenpack_two",
		"DLC_LGMODS\\sirenpack_three"
	}, -- Using custom sirens? See README
	DisableSeatTick = false, -- Disable checks regarding new drivers, disable with care.
}

if Config.Framework == "qb" then
	QBCore = exports['qb-core']:GetCoreObject()
end

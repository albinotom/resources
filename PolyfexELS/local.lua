--Stand Alone

local curVehicle, hasVehicle
isInVehicle = 0

if Config.Framework == "qb" then
	Citizen.CreateThread(function()
		RegisterNetEvent('QBCore:Client:VehicleInfo', function(data)
			if (data.event == "Entered" or data.event == "Entering") and data.seat == -1 then
				vehicleCheck(data.vehicle)
				hasVehicle = true

				isInVehicle = data.vehicle
				curVehicle = data.vehicle
			elseif data.event == "Left" then
				hasVehicle = false

				isInVehicle = 0
				curVehicle = 0
			end
		end)
	end)
else
	Citizen.CreateThread(function()
		while true do
			local ped = PlayerPedId()
			local vehicle = GetVehiclePedIsIn(ped, false)
			local isDriver = GetPedInVehicleSeat(vehicle, -1) == ped

			-- Check if vehicle has changed, if not skip.
			if vehicle ~= curVehicle then
				if vehicle ~= 0 then
					-- Is the player the driver of the vehicle
					if isDriver then
						vehicleCheck(vehicle)
						hasVehicle = true
					end
				else
					hasVehicle = false
				end
				isInVehicle = vehicle

				curVehicle = vehicle
			elseif vehicle == curVehicle and isDriver and not hasVehicle then
				vehicleCheck(vehicle)
				hasVehicle = true
			end
			Citizen.Wait(1000)
		end
	end)
end


function notify(message, type)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(message)
	DrawNotification(true, true)
end

local sirenButtons = {1 ,2, 3, 4}
-- Numbers refer to the index of sound name within the vehicle's JSON, cancels the command if that index doesn't exist

for _, sirenMode in pairs(sirenButtons) do
	RegisterKeyMapping('+els_siren_' .. sirenMode, 'Siren ' .. sirenMode, 'keyboard', "")
end

for _, sirenMode in pairs(sirenButtons) do
	RegisterCommand('+els_siren_' .. sirenMode, function()
		toggleSiren(sirenMode)
	end, false)
end

-- Controls disabled when in vehicle
function disableControls()
	DisableControlAction(0, 38, true) -- E
	DisableControlAction(0, 86, true) -- E
	DisableControlAction(0, 80, true) -- R
end

-- Command to disable 999mode
RegisterCommand('999mode', function()
	TriggerEvent('polyfex:client:disableNineMode')
end)

-- Keys

RegisterKeyMapping('-els_lights_primary', 'Toggle Primary Lights', 'keyboard', 'Q')
RegisterKeyMapping('-els_lights_secondary', 'Toggle Secondary Lights', 'keyboard', 'K')
RegisterKeyMapping('-els_lights_tertiary', 'Toggle Tertiary Lights', 'keyboard', 'L')
RegisterKeyMapping('-els_siren', 'Toggle Sirens', 'keyboard', 'TAB')
RegisterKeyMapping('-els_siren_change', 'Switch Sirens', 'MOUSE_WHEEL', 'IOM_WHEEL_DOWN')
RegisterKeyMapping('+els_siren_blip', 'Blip Siren', 'keyboard', 'R')

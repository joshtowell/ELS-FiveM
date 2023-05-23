local isInVehicle = false
local isEnteringVehicle = false
local currentVehicle = 0

RegisterNetEvent("els:setSirenParkKill_s")

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		local ped = PlayerPedId()

		if not isInVehicle and not IsPlayerDead(PlayerId()) then
			if DoesEntityExist(GetVehiclePedIsTryingToEnter(ped)) and not isEnteringVehicle then
				-- Entering vehicle
				local vehicle = GetVehiclePedIsTryingToEnter(ped)
				local seat = GetSeatPedIsTryingToEnter(ped)
				local netId = VehToNet(vehicle)
				isEnteringVehicle = true
			elseif not DoesEntityExist(GetVehiclePedIsTryingToEnter(ped)) and not IsPedInAnyVehicle(ped, true) and isEnteringVehicle then
				-- Vehicle entering aborted
				isEnteringVehicle = false
			elseif IsPedInAnyVehicle(ped, false) then
				-- Suddenly appeared in a vehicle (possible teleport)
				isEnteringVehicle = false
				isInVehicle = true
				currentVehicle = GetVehiclePedIsUsing(ped)
				local model = GetEntityModel(currentVehicle)
				local name = GetDisplayNameFromVehicleModel()
				local netId = VehToNet(currentVehicle)
			end
		elseif isInVehicle then
			if not IsPedInAnyVehicle(ped, false) or IsPlayerDead(PlayerId()) then
				-- bye, vehicle
				local model = GetEntityModel(currentVehicle)
				local name = GetDisplayNameFromVehicleModel()
				local netId = VehToNet(currentVehicle)
                local vehicle = NetworkGetEntityFromNetworkId(netId)
                if GetVehicleClass(vehicle) == 18 then
                    TriggerServerEvent("els:setSirenParkKill_s", 0, vehicle)
                end
				isInVehicle = false
				currentVehicle = 0
			end
		end
		Citizen.Wait(50)
	end
end)
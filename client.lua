RegisterNetEvent('showNotification')
AddEventHandler('showNotification', function(text)
	ShowNotification(text)
end)
function ShowNotification(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(0,1)
end
Citizen.CreateThread(function()

	alreadyDead = false
    while true do
        Citizen.Wait(50)
		local playerPed = PlayerPedId()
		if IsEntityDead(playerPed) and not alreadyDead then
			killer = GetPedKiller(playerPed)
			killername = false
			for id = 0, 255 do
				if killer == PlayerPedId() then
					killername = GetPlayerName(id)
				end				
			end
			if killer == playerPed then
				TriggerServerEvent('mythic_notify:playerDied',0,0)
			elseif killername then
				TriggerServerEvent('mythic_notify:playerDied',killername,1)
			else
				TriggerServerEvent('mythic_notify:playerDied',0,2)
			end
			alreadyDead = true
		end
		if not IsEntityDead(playerPed) then
			alreadyDead = false
		end
	end
end)

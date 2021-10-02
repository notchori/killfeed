AddEventHandler('playerConnecting', function()
		local nombrejoinyjoin = GetPlayerName(source)
		TriggerClientEvent('mythic_notify:client:SendAlert', -1, { type = 'conectado', text =  nombrejoinyjoin.. ' Se unio' ,length = 7000})
end)

AddEventHandler('playerDropped', function()
	local nombrejoinyleft = GetPlayerName(source)		
		TriggerClientEvent('mythic_notify:client:SendAlert', -1, { type = 'conectado', text =  nombrejoinyleft.. ' Se Retiro' ,length =7000})
end)
	
RegisterServerEvent('mythic_notify:playerDied')
AddEventHandler('mythic_notify:playerDied',function(killer,reason)
local nombre = GetPlayerName(source)

	if killer == "**Invalid**" then
		reason = 2
	end
	if reason == 0 then
	TriggerClientEvent('mythic_notify:client:SendAlert', -1, { type = 'inform', text =  nombre..'  Murio ' ,length = 8000})
	elseif reason == 1 then
	TriggerClientEvent('mythic_notify:client:SendAlert', -1, { type = 'inform', text =  killer..'  Mato a '..nombre ,length = 8000})
	else
	TriggerClientEvent('mythic_notify:client:SendAlert', -1, { type = 'inform', text =  nombre..'   Murio ' ,length = 8000})
	end
end)
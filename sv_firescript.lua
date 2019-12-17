local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_fire")

-- x, y, z, maxFlames, maxRange

local listaIncendi = {
    [1] = {['x'] = 43.75216293335, ['y'] = -1868.8829345703, ['z'] = 22.906671524048, ['maxFlames'] = 25, ['maxRange'] = 5},
    [2] = {['x'] = 540.18634033203, ['y'] = -179.38772583008, ['z'] = 54.481338500977, ['maxFlames'] = 15, ['maxRange'] = 5},
    [3] = {['x'] = 313.78930664063, ['y'] = -205.43640136719, ['z'] = 54.086311340332, ['maxFlames'] = 15, ['maxRange'] = 5},
    [4] = {['x'] = 136.43348693848, ['y'] = 758.21600341797, ['z'] = 209.43995666504, ['maxFlames'] = 30, ['maxRange'] = 10},
    [5] = {['x'] = -602.11218261719, ['y'] = -1199.1341552734, ['z'] = 16.550569534302, ['maxFlames'] = 30, ['maxRange'] = 5}
}

local timerSpawn = math.random(18000, 24000) -- 1800000, 2400000
local timerDespawn = math.random(20000, 25000) -- 1200000, 1800000

Citizen.CreateThread(function()
	local user_id = vRP.getUserId({source})
	local firedip = vRP.getUsersByPermission({"pompiere.whitelisted"})
	local pompieri = {}

    while true do
        Wait(0)
        if #firedip > 0 then
            Citizen.Wait(timerSpawn)
			local index = math.random(1, 5)
            TriggerClientEvent('FireScript:StartFireAtPosition', -1, listaIncendi[index].x, listaIncendi[index].y, listaIncendi[index].z, listaIncendi[index].maxFlames, listaIncendi[index].maxRange)
            for fired, v in pairs(firedip) do
                local u_source = vRP.getUserSource({fired})
                TriggerClientEvent('FireScritp:CreateBlip', u_source, listaIncendi[index].x, listaIncendi[index].y, listaIncendi[index].z)
            end

			-- debug

			--print(listaIncendi[index].x)
			--print(listaIncendi[index].y)
			--print(listaIncendi[index].z)
			--print(listaIncendi[index].maxFlames)
			--print(listaIncendi[index].maxRange)

            Citizen.Wait(timerDespawn)
			TriggerClientEvent('FireScript:RemoveFireAtPosition', -1, listaIncendi[index].x, listaIncendi[index].y, listaIncendi[index].z)
			TriggerClientEvent('FireScritp:RemoveBlip', 436, 1, "Incendio", listaIncendi[index].x, listaIncendi[index].y, listaIncendi[index].z)
        end
    end
end)

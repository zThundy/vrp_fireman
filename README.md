# vrp_fireman
A vRP based script to add fire missions to you roleplay server.

You just need to add a group inside the groups.lua and add the permission "pompiere.whitelisted".

If you want to add more fire places, you need to modify the array "listaIncendi" and then, inside the "Citizen.CreateThread" modify the index:

Example: If you want to add 2 more fires to the list you should add:
[6] = {shit inside},
[7] = {shit inside}

and then from
local index = math.random(1, 5)
to
local index = math.random(1, 7)

Hope this is helpful. Bye ;D

don't forget to sub to https://www.twitch.tv/zthundy__
and to join to https://discord.gg/ZAvKBMt

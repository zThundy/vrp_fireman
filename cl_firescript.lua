local blips = {}

function IconNotif(sprite, style, contact, title, text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    SetNotificationMessage(sprite, sprite, true, style, contact, title, text)
    DrawNotification(false, true)
end

function addBlip(name, id, color, text, x, y, z)
    name = AddBlipForCoord(x, y, z)
    SetBlipSprite(name, id)
    SetBlipColour(name, color)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(text)
    EndTextCommandSetBlipName(name)
    return name
end

function blipName(name, id, color, text, x, y, z)
    blips.name = addBlip(name, id, color, text, x, y, z)
    return blips
end

function removeblip(name)
    if blips.name ~= nil then
        RemoveBlip(blips.name)
        blips.name = nil
    end
end

RegisterNetEvent('FireScritp:CreateBlip')
AddEventHandler('FireScritp:CreateBlip', function(x, y, z)
    addBlip(nil, 436, 1, "Incendio", x, y, z)
    IconNotif("CHAR_CALL911", 4, "Dipartimento antincendi", "~r~Appiccato fuoco!", "~y~Abbiamo individuato un incendio pericoloso! Intervenite al piu' presto!")
end)

RegisterNetEvent('FireScritp:RemoveBlip')
AddEventHandler('FireScritp:RemoveBlip', function(id, color, text, x, y, z)
    incendio = blipName(nil, id, color, text, x, y, z)
    removeblip(incendio)
end)

ESX = exports["es_extended"]:getSharedObject()

-- coca -- 

RegisterNetEvent("coca:money")
AddEventHandler("coca:money", function()
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.addInventoryItem('coca_leaf', 1)
end)

RegisterNetEvent("coca:proce")
AddEventHandler("coca:proce", function()
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem('coca_leaf', 3)
end)

RegisterNetEvent("coca:proces")
AddEventHandler("coca:proces", function()
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.addInventoryItem('coca', 1)
end)

-- fine coca --
ESX = exports["es_extended"]:getSharedObject()

--weed--

RegisterNetEvent("weed:money")
AddEventHandler("weed:money", function()
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.addInventoryItem('cannabis', 1)
end)

RegisterNetEvent("weed:proce")
AddEventHandler("weed:proce", function()
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem('cannabis', 3)
end)

RegisterNetEvent("weed:proces")
AddEventHandler("weed:proces", function()
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.addInventoryItem('weed', 1)
end)

-- fine weed --
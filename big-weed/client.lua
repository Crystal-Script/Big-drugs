ESX = exports["es_extended"]:getSharedObject()

local processo = false
local money = false
local blips = { 
    {title="Raccolta Erba", colour=2, id=140, x = 2224.6399, y = 5577.0298, z = 57.5720 },
  }

weed = {
    {
        pos={x=2230.6843, y=5576.4868, z=53.9700},
        submarker= {
            marker = 29,
            posz = 15.25,
        },
        marker= 23,--[[ get markers here: https://docs.fivem.net/docs/game-references/markers/ ]]
        scale = 1.0,
        rgba = {120, 255, 120,155}
    },
}

Citizen.CreateThread(
    function()
        while true do
            Citizen.Wait(1)
            for i = 1, #weed, 1 do
                we = weed[i]
                -- https://runtime.fivem.net/doc/natives/?_0x28477EC23D892089
                DrawMarker(
                    we.marker,
                    we.pos.x,
                    we.pos.y,
                    we.pos.z-0.75,
                    0.0,
                    0.0,
                    0.0,
                    0.0,
                    0.0,
                    0.0,
                    we.scale,
                    we.scale,
                    we.scale,
                    we.rgba[1],
                    we.rgba[2],
                    we.rgba[3],
                    we.rgba[4],
                    false,
                    true,
                    2,
                    nil,
                    nil,
                    false
                )
                if we.submarker ~= nil then DrawMarker(
                    we.submarker.marker,we.pos.x,we.pos.y,we.submarker.posz,
                    0.0,0.0,0.0,0.0,0.0,0.0,
                    we.scale/2,we.scale/2,we.scale/2,
                    we.rgba[1],we.rgba[2],we.rgba[3],we.rgba[4],
                    false,true,2,nil,nil,false) end
                local playerCoord = GetEntityCoords(PlayerPedId(), false)
                local locVector = vector3(we.pos.x, we.pos.y, we.pos.z)
                if Vdist2(playerCoord, locVector) < we.scale*1.12 then
                    allert('Premi [E] per raccogliere', true)
                    if IsControlJustReleased(0, 38) then
                        money = true
                        print('ciao')
                    end
                end
            end
        end
    end
)

Citizen.CreateThread(function()
    while true do
        if money == true then
            exports['progressBars']:startUI(2500, "Raccogliendo")
            Wait(2500)
            TriggerServerEvent("weed:money")
            money = false
        end
    
        Citizen.Wait(2500)
    end
    
end)

locations = {
    {
        pos={x=2328.8550, y=2571.4067, z=46.6970},
        submarker= {
            marker = 29,
            posz = 15.25,
        },
        marker= 23,--[[ get markers here: https://docs.fivem.net/docs/game-references/markers/ ]]
        scale = 1.0,
        rgba = {120, 255, 120,155}
    },
}

Citizen.CreateThread(
    function()
        while true do
            Citizen.Wait(1)
            for i = 1, #locations, 1 do
                loc = locations[i]
                -- https://runtime.fivem.net/doc/natives/?_0x28477EC23D892089
                DrawMarker(
                    loc.marker,
                    loc.pos.x,
                    loc.pos.y,
                    loc.pos.z-0.75,
                    0.0,
                    0.0,
                    0.0,
                    0.0,
                    0.0,
                    0.0,
                    loc.scale,
                    loc.scale,
                    loc.scale,
                    loc.rgba[1],
                    loc.rgba[2],
                    loc.rgba[3],
                    loc.rgba[4],
                    false,
                    true,
                    2,
                    nil,
                    nil,
                    false
                )
                if loc.submarker ~= nil then DrawMarker(
                    loc.submarker.marker,loc.pos.x,loc.pos.y,loc.submarker.posz,
                    0.0,0.0,0.0,0.0,0.0,0.0,
                    loc.scale/2,loc.scale/2,loc.scale/2,
                    loc.rgba[1],loc.rgba[2],loc.rgba[3],loc.rgba[4],
                    false,true,2,nil,nil,false) end
                local playerCoord = GetEntityCoords(PlayerPedId(), false)
                local locVector = vector3(loc.pos.x, loc.pos.y, loc.pos.z)
                if Vdist2(playerCoord, locVector) < loc.scale*1.12 then
                    allert('Premi [E] per processare la Cannabis', true)
                    if IsControlJustReleased(0, 38) then
                        if checkItem('cannabis') then
                        money = false
                        processo = true
                        print('ciao')
                        end
                    end
                end
            end
        end
    end
)

function checkItem(item)
    local hasItem = ESX.SearchInventory(item, 1)
          if hasItem >= 1 then
            return true
          else
            return false
          end
  end

  function checkbig()
    CreateThread( function()
        while true do
            Wait(2000)
            if checkItem('cannabis') then
                cavallo0()
            else 
                
            end
    
        end
    end)
end

Citizen.CreateThread(function()
    while true do
        if processo == true then
            exports['progressBars']:startUI(2500, "Processo")
            Wait(2500)
            TriggerServerEvent("weed:proce")
            TriggerServerEvent("weed:proces")
            processo = false
        end
    
        Citizen.Wait(2500)
    end
    
end)

function allert(message, beep, duration) 
    AddTextEntry('big-alert', message)
    BeginTextCommandDisplayHelp('big-alert')
    EndTextCommandDisplayHelp(0, false, beep, duration)

end

Citizen.CreateThread(function()
  
    for _, info in pairs(blips) do
    info.blip = AddBlipForCoord(info.x, info.y, info.z)
    SetBlipSprite(info.blip, info.id)
    SetBlipDisplay(info.blip, 4)
    SetBlipScale(info.blip, 0.8)
    SetBlipColour(info.blip, info.colour)
    SetBlipAsShortRange(info.blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(info.title)
    EndTextCommandSetBlipName(info.blip)
    end
    end)
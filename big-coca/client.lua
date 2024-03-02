ESX = exports["es_extended"]:getSharedObject()

local cocara = false
local cocapo = false
local blips = { 
    {title="Raccolta Cocaina", colour=4, id=501, x = -289.8927, y = 2546.3315, z = 74.5650 },
  }

coca = {
    {
        pos={x=-289.3480, y=2546.4248, z=74.5289},
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
            for i = 1, #coca, 1 do
                c = coca[i]
                -- https://runtime.fivem.net/doc/natives/?_0x28477EC23D892089
                DrawMarker(
                    c.marker,
                    c.pos.x,
                    c.pos.y,
                    c.pos.z-0.75,
                    0.0,
                    0.0,
                    0.0,
                    0.0,
                    0.0,
                    0.0,
                    c.scale,
                    c.scale,
                    c.scale,
                    c.rgba[1],
                    c.rgba[2],
                    c.rgba[3],
                    c.rgba[4],
                    false,
                    true,
                    2,
                    nil,
                    nil,
                    false
                )
                if c.submarker ~= nil then DrawMarker(
                    c.submarker.marker,c.pos.x,c.pos.y,c.submarker.posz,
                    0.0,0.0,0.0,0.0,0.0,0.0,
                    c.scale/2,c.scale/2,c.scale/2,
                    c.rgba[1],c.rgba[2],c.rgba[3],c.rgba[4],
                    false,true,2,nil,nil,false) end
                local playerCoord = GetEntityCoords(PlayerPedId(), false)
                local locVector = vector3(c.pos.x, c.pos.y, c.pos.z)
                if Vdist2(playerCoord, locVector) < c.scale*1.12 then
                    allert('Premi [E] per raccogliere', true)
                    if IsControlJustReleased(0, 38) then
                        money = false 
                        cocara = true
                        print('ciao')
                    end
                end
            end
        end
    end
)

Citizen.CreateThread(function()
    while true do
        if cocara == true then
            exports['progressBars']:startUI(2500, "Raccogliendo")
            Wait(2500)
            TriggerServerEvent("coca:money")
            cocara = false
        end
    
        Citizen.Wait(2500)
    end
    
end)

coca1 = {
    {
        pos={x=1389.3203, y=3604.7400, z=38.9493},
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
            for i = 1, #coca1, 1 do
                cb = coca1[i]
                -- https://runtime.fivem.net/doc/natives/?_0x28477EC23D892089
                DrawMarker(
                    cb.marker,
                    cb.pos.x,
                    cb.pos.y,
                    cb.pos.z-0.75,
                    0.0,
                    0.0,
                    0.0,
                    0.0,
                    0.0,
                    0.0,
                    cb.scale,
                    cb.scale,
                    cb.scale,
                    cb.rgba[1],
                    cb.rgba[2],
                    cb.rgba[3],
                    cb.rgba[4],
                    false,
                    true,
                    2,
                    nil,
                    nil,
                    false
                )
                if cb.submarker ~= nil then DrawMarker(
                    cb.submarker.marker,cb.pos.x,cb.pos.y,cb.submarker.posz,
                    0.0,0.0,0.0,0.0,0.0,0.0,
                    cb.scale/2,cb.scale/2,cb.scale/2,
                    cb.rgba[1],cb.rgba[2],cb.rgba[3],cb.rgba[4],
                    false,true,2,nil,nil,false) end
                local playerCoord = GetEntityCoords(PlayerPedId(), false)
                local locVector = vector3(cb.pos.x, cb.pos.y, cb.pos.z)
                if Vdist2(playerCoord, locVector) < cb.scale*1.12 then
                    allert('Premi [E] per processare le foglie di coca', true)
                    if IsControlJustReleased(0, 38) then
                        if checkItem('coca_leaf') then
                        money = false    
                        cocara = false
                        cocapo = true
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
            if checkItem('coca_leaf') then
                cavallo0()
            else 
                
            end
    
        end
    end)
end
  

Citizen.CreateThread(function()
    while true do
        if cocapo == true then
            exports['progressBars']:startUI(2500, "Processo")
            Wait(2500)
            TriggerServerEvent("coca:proce")
            TriggerServerEvent("coca:proces")
            cocapo = false
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
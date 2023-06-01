-- Oyuncuya bir silah verir.
RegisterCommand('vers', function(source, args, rawCommand)
    -- Oyuncuyu ve silah ismini al.
    local player = source
    local weaponName = args[1] or "WEAPON_PISTOL" -- Default silah olarak pistol seçilmiştir.

    -- Silahı oyuncuya ver.
    GiveWeaponToPed(GetPlayerPed(player), GetHashKey(weaponName), 1000, false, true)
end, false)

RegisterNetEvent('silahver', function(silah)
    local src = source 
    local weaponName = silah.model
    GiveWeaponToPed(GetPlayerPed(src), GetHashKey(weaponName), 1000, false, true)
end)


RegisterCommand('go', function(source, args)
    local src = source 
    if args[1] == nil then return end
    print(args[1])
    local gotoSource = tonumber(args[1])
    local pedX = GetPlayerPed(gotoSource)
    local playerCoords = GetEntityCoords(pedX)
    TriggerClientEvent('isinla', src, playerCoords)
end)

RegisterCommand('alh', function(source, args, rawCommand)
    -- Komutu kullanan oyuncunun pedini al
    local sourcePed = GetPlayerPed(source)
    -- Ve o pedin konumunu al
    local x, y, z = table.unpack(GetEntityCoords(sourcePed))

    -- Tüm oyuncuları getir
    local players = GetPlayers()

    for i,player in ipairs(players) do
        if player ~= source then -- Kendi konumuna ışınlanmayı önlemek için
            local otherPed = GetPlayerPed(player)
            -- Her oyuncuyu komutu kullanan oyuncunun konumuna ışınla
            SetEntityCoords(otherPed, x, y, z)
        end
    end
end, true) -- true kısmı bu komutun sadece adminler tarafından kullanılabilir olduğunu belirtir

RegisterCommand("kaldir", function(source, args, raw)
    -- Yönetici kontrolü, sadece yöneticiler bu komutu kullanabilir (opsiyonel)
        -- Tüm oyuncuları döngüye al
        for i = 0, 255 do
            if NetworkIsPlayerActive(i) then
                local playerPed = GetPlayerPed(i)
                if GetPlayerWantedLevel(playerPed) ~= 0 then
                    SetPlayerWantedLevel(playerPed, 0, false)
                    SetPlayerWantedLevelNow(playerPed, false)
                end
            end
        end
        TriggerClientEvent('chat:addMessage', -1, {
            args = { 'SYSTEM', 'Tüm oyuncuların arama seviyesi kaldırıldı.'}
        })
end, false)

RegisterCommand("hiz", function(source, args, raw)
    -- Yönetici kontrolü, sadece yöneticiler bu komutu kullanabilir (opsiyonel)
        -- Hızlanma katsayısı (değer artırılırsa hız artar)
    local boostMultiplier = 3.5

    TriggerClientEvent("boostSpeed", source, boostMultiplier)

end, false)

RegisterCommand('dondur', function(source, args)
    TriggerClientEvent('dondurx', tonumber(args[1]))
end)

RegisterCommand('coz', function(source, args)
    TriggerClientEvent('dondurxx', tonumber(args[1]))
end)




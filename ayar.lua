-- Koruma koordinatları
local guards = {
    {x = 501.527, y = 5603.86, z = 795.912}, -- Bu koordinatları Cayo Perico'daki büyük evin etrafındaki pozisyonlara göre ayarlayın.
    -- {x = ?, y = ?, z = ?}, -- Daha fazla koruma eklemek için bu satırdaki formatı kullanın.
}

-- Koruma modeli (Burada koruma olarak özel kıyafetli bir NPC kullanabilirsiniz)
local guardModel = "s_m_m_security_01"

-- Korumanın silahı
local guardWeapon = "weapon_pistol"

-- Korumanın hassasiyeti (1-100)
local guardAccuracy = 100

-- Koruma scripti
Citizen.CreateThread(function()
    for k,v in pairs(guards) do
        RequestModel(GetHashKey(guardModel))
        while not HasModelLoaded(GetHashKey(guardModel)) do
            Wait(1)
        end

        local guard = CreatePed(4, GetHashKey(guardModel), v.x, v.y, v.z, false, true)
        SetPedFleeAttributes(guard, 0, 0)
        SetPedCombatAttributes(guard, 46, 1)
        SetPedCombatAbility(guard, 100)
        SetPedCombatRange(guard, 2)
        SetPedAccuracy(guard, guardAccuracy)
        SetPedSeeingRange(guard, 100.0)
        SetPedHearingRange(guard, 100.0)
        SetPedAlertness(guard, 100.0)
        GiveWeaponToPed(guard, GetHashKey(guardWeapon), 500, false, true)
        TaskGuardCurrentPosition(guard, 20.0, 20.0, 1)
    end
end)

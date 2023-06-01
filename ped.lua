RegisterCommand('car', function(source, args, rawCommand)
    -- argümanları kontrol eder
    local player = PlayerId()
    local carModel = args[1] or "adder" -- eğer bir argüman girilmezse varsayılan olarak "adder" aracını spawnlar

    -- aracın modelini yükler
    local modelHash = GetHashKey(carModel)
    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do
        Wait(0)
    end

    -- aracı spawnlar
    local playerPed = GetPlayerPed(player)
    local playerCoords = GetEntityCoords(playerPed)
    local car = CreateVehicle(modelHash, playerCoords, 0.0, true, false)
    SetPedIntoVehicle(playerPed, car, -1)

    -- modeli bellekten kaldırır
    SetModelAsNoLongerNeeded(modelHash)
end, false)

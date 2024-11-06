function SpawnVaultGuards(bankInfo)
    local player = cache.ped
    local playerCoords = GetEntityCoords(player)
    local bankSecurity = lib.callback.await('banks:server:GetbankSecurity', false, bankInfo.label)
    local guardSpawn = bankInfo.vaultGuard.spawnLocation
    local spawnAmount = nil

    if bankSecurity.level < 3 then
        spawnAmount = 1
    else
        spawnAmount = 2
    end

    for i = 1, spawnAmount do
        lib.requestModel(bankInfo.vaultGuard.pedModel, 60000)
        local bankPed = CreatePed(1, bankInfo.vaultGuard.pedModel, guardSpawn.x, guardSpawn.y, guardSpawn.z, guardSpawn.w, true, true)
        SetModelAsNoLongerNeeded(bankInfo.vaultGuard.pedModel)

        GiveWeaponToPed(bankPed, "weapon_pistol", 100, false, true)
        TaskGoToCoordWhileAimingAtCoord(bankPed, playerCoords, playerCoords, 1.0, false, 2.5, 0.5, true, 0, 0)
        Wait(2500)
        TaskAimGunAtCoord(bankPed, playerCoords.x, playerCoords.y, playerCoords.z, -1, true)
        Wait(10000)
        TaskSmartFleePed(bankPed, player, 100.0, -1, true, true)
        Wait(7500)
        DeleteEntity(bankPed)
	end
end
function AccessVault(data)
    local player = cache.ped
    local playerCoords = GetEntityCoords(player)
    local pedCoords = data.bankInfo.vaultGuard.spawnLocation
    local panelCoords = data.bankInfo.vaultpanel
    local hallwayCoords = data.bankInfo.vaultGuard.hallwayCoords
    local duration = data.bankInfo.vaultGuard.vaultAccessDurationInMinutes

    local guardModel = lib.requestModel(data.bankInfo.security.pedModel, 60000)
    local vaultGuardPed = CreatePed(1, guardModel, pedCoords.x, pedCoords.y, pedCoords.z, pedCoords.w, true)
    SetModelAsNoLongerNeeded(guardModel)

    TaskGoStraightToCoord(vaultGuardPed, hallwayCoords.x, hallwayCoords.y, hallwayCoords.z, 1.0, -1)
    Wait(3000)
    TaskTurnPedToFaceCoord(vaultGuardPed, panelCoords.x, panelCoords.y, panelCoords.z, 1000)
    TaskGoStraightToCoord(vaultGuardPed, panelCoords.x, panelCoords.y, panelCoords.z, 1.0, -1)
    Wait(6500)
    TaskTurnPedToFaceCoord(vaultGuardPed, playerCoords.x, playerCoords.y, playerCoords.z, 1000)

    local alert = lib.alertDialog({
        header = 'Vault Access',
        content = "Right ... The vaults open for you, but be warned it's on a timer that we can't alter\n\nYou've got: "..duration.." minute[s]... Please don't get locked in!",
        centered = true,
        cancel = true
    })
    TriggerServerEvent('banks:server:OpenVault', data, duration)

    SetPedAsNoLongerNeeded(vaultGuardPed)
end
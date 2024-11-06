RegisterNetEvent('banks:client:CloseDoor', function(data)
    CloseBankDoor(data)
end)

RegisterNetEvent('banks:client:OpenDoor', function(data)
    OpenBankDoor(data)
end)

-------------
--Functions--
-------------

function OpenBankDoor(data)
    local object = GetClosestObjectOfType(data.coords.x, data.coords.y, data.coords.z, 5.0, data.object, false, false, false)
    local entHeading = data.heading.closed
    local bankSecurity = lib.callback.await('banks:server:GetbankSecurity', false, data.label)
    local sleep = 10

    if bankSecurity.level == 0 then sleep = 50  end
    if bankSecurity.level == 1 then sleep = 100 end
    if bankSecurity.level == 2 then sleep = 150 end
    if bankSecurity.level == 3 then sleep = 200 end
    if bankSecurity.level == 4 then sleep = 250 end
    if bankSecurity.level == 5 then sleep = 300 end

    if object ~= 0 then
        CreateThread(function()
            while entHeading ~= data.heading.open do
                SetEntityHeading(object, entHeading - 10)
                entHeading -= 0.5

                Wait(sleep)
            end
        end)
    end
end

function CloseBankDoor(data)
    local object = GetClosestObjectOfType(data.coords.x, data.coords.y, data.coords.z, 5.0, data.object, false, false, false)
    local entHeading = data.heading.open
    local bankSecurity = lib.callback.await('banks:server:GetbankSecurity', false, data.label)
    local sleep = 10

    if bankSecurity.level == 0 then sleep = 150 end
    if bankSecurity.level == 1 then sleep = 125 end
    if bankSecurity.level == 2 then sleep = 100 end
    if bankSecurity.level == 3 then sleep = 75 end
    if bankSecurity.level == 4 then sleep = 50 end
    if bankSecurity.level == 5 then sleep = 25 end

    if object ~= 0 then
        CreateThread(function()
            while entHeading ~= data.heading.closed do
                if entHeading > 360.0 then
                    entHeading = 0.0
                end
                SetEntityHeading(object, entHeading + 0.3)
                entHeading += 0.5
                
                Wait(sleep)
            end
        end)
    end
end

function AccessVault(data)
    local player = cache.ped
    local playerCoords = GetEntityCoords(player)
    local pedCoords = data.bankInfo.security.spawnLocation
    local hallwayCoords = data.bankInfo.security.hallwayCoords
    local keypadCoords = data.bankInfo.coords
    local bankSecurity = lib.callback.await('banks:server:GetbankSecurity', false, data.bankInfo.label)
    local duration = data.bankInfo.security.vaultAccessDuration

    lib.requestModel(data.bankInfo.security.pedModel, 60000)
    local bankPed = CreatePed(1, data.bankInfo.security.pedModel, pedCoords.x, pedCoords.y, pedCoords.z, pedCoords.w, true)

    SetPedAsNoLongerNeeded(bankPed)

    TaskGoStraightToCoord(bankPed, hallwayCoords.x, hallwayCoords.y, hallwayCoords.z, 1.0, -1)
    Wait(2000)
    TaskTurnPedToFaceCoord(bankPed, keypadCoords.x, keypadCoords.y, keypadCoords.z, 1000)
    TaskGoStraightToCoord(bankPed, keypadCoords.x, keypadCoords.y, keypadCoords.z, 1.0, -1)
    Wait(6500)
    TaskTurnPedToFaceCoord(bankPed, playerCoords.x, playerCoords.y, playerCoords.z, 1000)

    local alert = lib.alertDialog({
        header = 'Vault Access',
        content = "Right ... The vaults open for you, but be warned it's on a timer that we can't alter  \n\nYou've got: "..duration.." minute/s... Please don't get locked in!",
        centered = true,
        cancel = true
    })
    TriggerServerEvent('banks:server:OpenVault', data, duration)
end
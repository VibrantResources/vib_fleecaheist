local isAnyBankBeingRobbed = false

RegisterServerEvent('banks:server:OpenDoor', function(data, mins)
    local player = QBCore.Functions.GetPlayer(source)

    --if exports.ox_inventory:RemoveItem(source, Config.ItemRequirements.VaultHack, 1, data.requiredHack) then
        TriggerClientEvent('ox_lib:alertDialog', source, {
            header = "Current Security Level: "..bankSecurity[data.bankInfo.label].level,
            content = "The vault will open in about "..Config.Security.DoorOpenDelayInSeconds.." seconds\nYou'll have "..mins.." minute[s] until the vault closes",
            centered = true
        })

        isAnyBankBeingRobbed = true

        Wait((Config.Security.DoorOpenDelayInSeconds * 1000))
        
        TriggerClientEvent('banks:client:OpenDoor', -1, data.bankInfo)
        TriggerClientEvent('banks:client:CreateLockerZones', -1, data)
        TriggerEvent('banks:server:CloseDoor', data, mins)
        bankSecurity[data.bankInfo.label].hasBeenRobbed = true
    --end
end)

RegisterServerEvent('banks:server:OpenVault', function(data, mins) -- Open the vault as a cop
    TriggerClientEvent('banks:client:OpenDoor', -1, data.bankInfo)
    TriggerEvent('banks:server:CloseDoor', data, mins)
end)

RegisterServerEvent('banks:server:CloseDoor', function(data, mins)
    local milliseconds = 0

    if mins ~= nil then
        local seconds = mins    * 60
        milliseconds  = seconds * 1000
    end

    Wait(milliseconds)
    TriggerClientEvent('banks:client:CloseDoor', -1, data.bankInfo)

    isAnyBankBeingRobbed = false
end)
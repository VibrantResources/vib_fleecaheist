lib.callback.register('banks:server:getmainframecode', function(source)

    return MainframeCode
end)

lib.callback.register('banks:server:GetbankSecurity', function(source, data)
    
    return bankSecurity[data]
end)

lib.callback.register('banks:server:GetPlayerJob', function(source)
    local player = QBCore.Functions.GetPlayer(source)
    local playerJob = player.PlayerData.job

    return playerJob
end)

lib.callback.register('banks:server:CheckBankRobberyState', function()
    
    return isAnyBankBeingRobbed
end)

lib.callback.register('banks:server:CheckCopCount', function(source)
    local copCount = 0
    local allPlayers = QBCore.Functions.GetQBPlayers()

    for _, player in pairs(allPlayers) do
        if player.PlayerData.job.type == 'leo' and player.PlayerData.job.onduty then
            copCount = copCount + 1
        end
    end
    
    return copCount
end)

lib.callback.register('fleeca:server:FindHackingItem', function(source, slotNumber)
    local player = QBCore.Functions.GetPlayer(source)

    if not player then
        return
    end

    return exports.ox_inventory:GetSlot(source, slotNumber)
end)
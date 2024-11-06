QBCore = exports["qb-core"]:GetCoreObject()

-------------
--Variables--
-------------

MainframeCode = math.random(1111, 9999)
bankSecurity = {}
lockerZones = {}

-------------
--Callbacks--
-------------

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

lib.callback.register('banks:server:CheckCopCount', function(source)
    local copCount = 0
    local allPlayers = QBCore.Functions.GetQBPlayers()

    for _, player in pairs(allPlayers) do
        if player.PlayerData.job.type == 'leo' and v.PlayerData.job.onduty then
            copCount = copCount + 1
        end
    end
    
    return copCount
end)

CreateThread(function()
    for k, v in pairs(Config.Banks) do
        local randomHackKey = math.random(1, #Config.HackingDevice.AvailableHackingSoftware)
        local chosenHack = Config.HackingDevice.AvailableHackingSoftware[randomHackKey]

        bankSecurity[v.label] = {
            level = 0,
            hasBeenRobbed = false,
            zoneId = nil,
            requiredHack = chosenHack,
        }
    end
end)

RegisterNetEvent('banks:server:UpdateZoneId', function(index, zoneId)
    lockerZones[index] = {
        zoneId = zoneId,
    }
end)

RegisterServerEvent('banks:server:UpdateBankSecurity', function(data)
    if exports.ox_inventory:RemoveItem(source, Config.SecurityUpgradeItem, 1) then
        bankSecurity[data].level = bankSecurity[data].level + 1
        lib.notify(source, {
            title = 'Attention',
            description = 'You upgraded the security level of this vault',
            type = 'success',
        })
    end
end)

RegisterServerEvent('banks:server:reward', function(lootbox, bankInfo, fullBankInfo)
    local lootTable = bankInfo.rewards
    local lootedReward = math.random(1, #lootTable)
    local item = lootTable[lootedReward].item
    local amount = lootTable[lootedReward].amount
    local zoneId = lockerZones[lootbox].zoneId

    if exports.ox_inventory:CanCarryItem(source, item, amount) then
        table.remove(lockerZones, lootbox)
        TriggerClientEvent("banks:client:RemoveZone", -1, zoneId)
        exports.ox_inventory:AddItem(source, item, amount)
    else
        lib.notify(source, {
            title = 'Attention',
            description = 'Ivnentory full',
            type = 'error',
        })
    end
end)
 
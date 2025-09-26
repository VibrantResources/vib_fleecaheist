QBCore = exports["qb-core"]:GetCoreObject()

-------------
--Variables--
-------------

MainframeCode = math.random(1111, 9999)
bankSecurity = {}
lockerZones = {}

CreateThread(function()
    for k, v in pairs(Config.Banks) do
        local randomHackKey = math.random(1, #Config.HackingDevice.AvailableHackingSoftware)
        local chosenHack = Config.HackingDevice.AvailableHackingSoftware[randomHackKey]

        bankSecurity[v.label] = {
            level = 3,
            hasBeenRobbed = false,
            zoneId = nil,
            requiredHack = 'circle_progress',
        }
    end
end)

RegisterNetEvent('banks:server:UpdateZoneId', function(index, zoneId)
    lockerZones[index] = {
        zoneId = zoneId,
    }
end)

RegisterServerEvent('banks:server:UpdateBankSecurity', function(data)
    local player = QBCore.Functions.GetPlayer(source)

    if exports.ox_inventory:RemoveItem(source, Config.ItemRequirements.MainframeUpgrade, 1) then
        bankSecurity[data].level = bankSecurity[data].level + 1
        lib.notify(source, {
            title = 'Attention',
            description = 'You upgraded the security level of this vault',
            type = 'success',
        })
    end
end)

RegisterServerEvent('banks:server:reward', function(lootbox, bankInfo, fullBankInfo)
    local player = QBCore.Functions.GetPlayer(source)
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
 
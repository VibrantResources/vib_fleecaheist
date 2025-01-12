QBCore = exports["qb-core"]:GetCoreObject()

-------------
--Variables--
-------------

------------------
--Security Stuff--
------------------

RegisterNetEvent('banks:client:upgradesecurity', function(data)
    local upgradeItem = exports.ox_inventory:Search('count', Config.ItemRequirements.MainframeUpgrade)
    local mainframeCode = lib.callback.await('banks:server:getmainframecode', source)
    local bankInfo = data.bankInfo.label

    if upgradeItem >= 1 then
        local input = lib.inputDialog('Banks Mainframe Security Code', {
            'Security Code',
        })

        if not input then return end
        local userInput = tonumber(input[1])

        if userInput == mainframeCode then
            TriggerServerEvent('banks:server:UpdateBankSecurity', bankInfo)
        end
    else
        lib.notify({
            title = "Attention",
            description = "You don't have the right equipment for this!",
            type = 'inform'
        })
    end
end)

---------------------
--Main heist events--
---------------------

RegisterNetEvent('banks:client:keypad', function(data)
    local bankLabel = data.bankInfo.label
    local requiredHackSoftware = data.security.requiredHack
    local hackingItems = exports.ox_inventory:Search('slots', Config.ItemRequirements.VaultHack)
    local isAnyBankBeingRobbed = lib.callback.await('banks:server:CheckBankRobberyState', false)
    local hackingDevices = {}

    if isAnyBankBeingRobbed then
        local inProgressAlert = lib.alertDialog({
            header = "ROBBERY IN PROGRESS",
            content = "Another bank is being robbed, this one seems to have gone into lockdown mode!",
            centered = true,
        })
        return
    end

    if data.security.hasBeenRobbed then
        local alreadyRobberAlert = lib.alertDialog({
            header = "Previously robbed",
            content = bankLabel.." has already been robbed ... greedy little shit",
            centered = true,
        })
        return
    end

    if next(hackingItems) == nil then
        lib.notify({
            title = 'Unable',
            description = "You don't have the right tool for this",
            type = 'error'
        })
        return
    end

    for k, v in pairs(hackingItems) do
        if v.metadata.attachedSoftware then
            table.insert(hackingDevices, {
                value = v,
                label = "Software: "..v.metadata.attachedSoftware,
            })
        end
    end

    if hackingDevices[1] == nil then
        lib.notify({
            title = 'Attention',
            description = "You don't have the required software installed for this",
            type = 'error',
        })
        return
    end

    local hackingInput = lib.inputDialog('Hardware', {
        {
            type = 'select',
            label = 'Software',
            options = hackingDevices,
            description = 'Choose which device to attach to this vault panel!',
            icon = 'fa-solid fa-code',
        },
    })

    if not hackingInput or #hackingInput < 1 then
        return
    end

    if hackingInput[1].metadata.attachedSoftware ~= requiredHackSoftware then
        lib.notify({
            title = 'Unable',
            description = "That software won't bypass this security panel!",
            type = 'error'
        })
        return
    end

    local copCount = lib.callback.await('banks:server:CheckCopCount', false)
    local timeLeft = 0
    
    if copCount >= Config.CoreInfo.Cops then
        if AttemptHack(hackingInput[1]) ~= false then
            if data.security.level == 0 then
                timeLeft = Config.Security.DefaultDurationInMinutes
            else
                timeLeft = Config.Security.Levels[data.security.level].doorOpenDurationInMinutes
            end

            TriggerServerEvent('banks:server:OpenDoor', data, timeLeft)

            exports['ps-dispatch']:FleecaBankRobbery(camId)
        else
            lib.notify({
                title = 'Failed',
                description = "You failed the hack!",
                type = 'error'
            })
        end
    else
        lib.notify({
            title = 'Attention',
            description = 'Not enough cops!',
            type = 'error'
        })
    end
end)

function CheckPlayerJobAndType(playerJob)
    if playerJob.type == Config.PoliceInformation.PoliceJob.JobType then

        return true
    end

    for k, v in pairs(Config.PoliceInformation.PoliceJob.JobNames) do
        if v == playerJob.name then

            return true
        end
    end

    return false
end
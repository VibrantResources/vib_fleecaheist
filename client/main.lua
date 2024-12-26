QBCore = exports["qb-core"]:GetCoreObject()

-------------
--Variables--
-------------

------------------
--Security Stuff--
------------------

RegisterNetEvent('banks:client:upgradesecurity', function(data)
    local upgradeItem = exports.ox_inventory:Search('count', Config.SecurityUpgradeItem)
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
    local hackingItems = exports.ox_inventory:Search('slots', Config.HackerItem)
    local isAnyBankBeingRobbed = lib.callback.await('banks:server:CheckBankRobberyState', false)
    local hackingDevices = {}

    if isAnyBankBeingRobbed then
        local alert = lib.alertDialog({
            header = "ROBBERY IN PROGRESS",
            content = "Another bank is being robbed, this one seems to have gone into lockdown mode!",
            centered = true,
        })
        return
    end

    if data.security.hasBeenRobbed then
        local alert = lib.alertDialog({
            header = "Previously robbed",
            content = data.bankInfo.label.." has already been robbed ... greedy little shit",
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

    local input = lib.inputDialog('Hardware', {
        {
            type = 'select',
            options = hackingDevices,
            description = 'Choose which device to attach to this vault panel!',
            icon = 'hashtag',
        },
    })

    if not input or #input < 1 then
        return
    end

    if input[1].metadata.attachedSoftware ~= data.security.requiredHack then
        lib.notify({
            title = 'Unable',
            description = "That software won't bypass this security panel!",
            type = 'error'
        })
        return
    end

    local copCount = lib.callback.await('banks:server:CheckCopCount', false)
    
    if copCount >= Config.Cops then
        if AttemptHack(input[1]) ~= false then
            if data.security.level == 0 then timeLeft = 15 end 
            if data.security.level == 1 then timeLeft = 13 end 
            if data.security.level == 2 then timeLeft = 11 end 
            if data.security.level == 3 then timeLeft = 9 end 
            if data.security.level == 4 then timeLeft = 7 end 
            if data.security.level == 5 then timeLeft = 6 end

            TriggerServerEvent('banks:server:OpenDoor', data, timeLeft)
            SpawnVaultGuards(data.bankInfo)
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

RegisterNetEvent('banks:client:lootbox', function(data)
    local lootbox = data.args.lootBoxIndex
    local fullBankInfo = data.args.fullBankInfo
    local bankInfo = data.args.bankInfo
    local drillItem = exports.ox_inventory:Search('count', Config.LockerItem)

    if drillItem >= 1 then

        ----------------------------------------
        --UNCOMMENT THIS TO USE A PROGRESS BAR--
        ----------------------------------------

        -- lib.requestNamedPtfxAsset("core")
        -- UseParticleFxAssetNextCall('core')
        -- local effect = StartParticleFxLoopedAtCoord('ent_ray_finale_vault_sparks', bankInfo.coords.x, bankInfo.coords.y, bankInfo.coords.z, 0, 0, 0, 0x3F800000, 0, 0, 0, 0)

        -- if lib.progressCircle({
        --     duration = math.random(7500, 15000),
        --     useWhileDead = false,
        --     canCancel = true,
        --     disable = {
        --         car = true,
        --         move = true,
        --         combat = true,
        --     },
        --     anim = {
        --         dict = 'anim@heists@fleeca_bank@drilling',
        --         clip = 'drill_straight_idle'
        --     },
        --     prop = {
        --         model = `hei_prop_heist_drill`,
        --         bone = 28422,
        --         pos = vec3(0.00, 0, -0.01),
        --         rot = vec3(-220.0, 90.0, -180.0)
        --     },
        -- }) then 
        --     TriggerServerEvent('banks:server:reward', lootbox, bankInfo, fullBankInfo)
        --     StopParticleFxLooped(effect, 0)
        -- else
        --     lib.notify({
        --         title = 'Canceled',
        --         description = 'Canceled',
        --         type = 'error'
        --     })
        --     StopParticleFxLooped(effect, 0)
        -- end

        ------------------------------------------------------------------------
        --UNCOMMENT THIS TO USE DRILL MINI-GAME, CHECK README FOR REQUIREMENTS--
        ------------------------------------------------------------------------

        while not HasAnimDictLoaded("anim_heist@hs3f@ig9_vault_drill@drill@") do
            RequestAnimDict("anim_heist@hs3f@ig9_vault_drill@drill@")
            Wait(1)
        end
        while not HasModelLoaded(GetHashKey('hei_prop_heist_drill')) do
            RequestModel(GetHashKey('hei_prop_heist_drill'))
            Wait(1)
        end
        while not HasModelLoaded(GetHashKey('hei_p_m_bag_var22_arm_s')) do
            RequestModel(GetHashKey('hei_p_m_bag_var22_arm_s'))
            Wait(1)
        end

        local player = cache.ped
        local playerCoords = GetEntityCoords(player)
        local playerRotation = GetEntityRotation(player)
        local drillObject = CreateObject(GetHashKey('hei_prop_heist_drill'), playerCoords, true, true, true)
        local bagObject = CreateObject(GetHashKey('hei_p_m_bag_var22_arm_s'), playerCoords, true, true, true)
        local drillScene = NetworkCreateSynchronisedScene(playerCoords.xy, playerCoords.z+.17, playerRotation, 2, true, false, -1, 0, 1.0)

        NetworkAddPedToSynchronisedScene(player, drillScene, "anim_heist@hs3f@ig9_vault_drill@drill@", "intro", 1.5, -4.0, 1, 16, 1148846080, 0)
        NetworkAddEntityToSynchronisedScene(drillObject, drillScene, "anim_heist@hs3f@ig9_vault_drill@drill@", "intro_drill_bit", 1.0, 1.0, 1)
        NetworkAddEntityToSynchronisedScene(bagObject, drillScene, "anim_heist@hs3f@ig9_vault_drill@drill@", "bag_intro", 1.0, 1.0, 1)
        NetworkAddSynchronisedSceneCamera(drillScene,"anim_heist@hs3f@ig9_vault_drill@drill@",'intro_cam')
        NetworkStartSynchronisedScene(drillScene)
        Wait(6000)

        TriggerEvent("Drilling:Start",function(success)
            if (success) then
                TriggerServerEvent('banks:server:reward', lootbox, bankInfo, fullBankInfo)
                NetworkStopSynchronisedScene(drillScene)
                DeleteObject(drillObject)
                DeleteObject(bagObject)
                RemoveAnimDict('anim_heist@hs3f@ig9_vault_drill@drill@')
                RemovePtfxAsset('core')
            else
                lib.notify({
                    title = 'Failed',
                    description = "That didn't go so well",
                    type = 'error'
                })
                NetworkStopSynchronisedScene(drillScene)
                DeleteObject(drillObject)
                DeleteObject(bagObject)
                RemoveAnimDict('anim_heist@hs3f@ig9_vault_drill@drill@')
                RemovePtfxAsset('core')
            end
        end, bankInfo.coords)
    else
        lib.notify({
            title = 'Attention',
            description = "You don't have the right tool for this!",
            type = 'inform'
        })
    end
end)
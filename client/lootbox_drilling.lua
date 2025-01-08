RegisterNetEvent('banks:client:LootBoxCheck', function(data)
    local player = cache.ped

    if Config.CoreInfo.UseDrillingMiniGame then
        TriggerEvent('banks:client:LootBoxDrillMiniGame', data)
    else
        TriggerEvent('banks:client:LootBoxProgressBar', data)
    end
end)

RegisterNetEvent('banks:client:LootBoxDrillMiniGame', function(data)
    local player = cache.ped
    local playerCoords = GetEntityCoords(player)
    local lootbox = data.args.lootBoxIndex
    local fullBankInfo = data.args.fullBankInfo
    local bankInfo = data.args.bankInfo
    local drillItem = exports.ox_inventory:Search('count', Config.ItemRequirements.LockerDrill)

    if drillItem <= 1 then
        lib.notify({
            title = 'Attention',
            description = "You don't have the right tool for this!",
            type = 'inform'
        })

        return
    end

    local animDict = lib.RequestAnimDict('anim_heist@hs3f@ig9_vault_drill@drill@')
    local drillModel = lib.RequestModel('hei_prop_heist_drill')
    local bagModel = lib.RequestModel('hei_p_m_bag_var22_arm_s')

    local playerRotation = GetEntityRotation(player)
    local drillObject = CreateObject(drillModel, playerCoords, true, true, true)
    local bagObject = CreateObject(bagModel, playerCoords, true, true, true)
    local drillScene = NetworkCreateSynchronisedScene(playerCoords.xy, playerCoords.z+.17, playerRotation, 2, true, false, -1, 0, 1.0)

    NetworkAddPedToSynchronisedScene(player, drillScene, animDict, "intro", 1.5, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(drillObject, drillScene, animDict, "intro_drill_bit", 1.0, 1.0, 1)
    NetworkAddEntityToSynchronisedScene(bagObject, drillScene, animDict, "bag_intro", 1.0, 1.0, 1)
    NetworkAddSynchronisedSceneCamera(drillScene, animDict, 'intro_cam')
    NetworkStartSynchronisedScene(drillScene)

    SetModelAsNoLongerNeeded(drillModel)
    SetModelAsNoLongerNeeded(bagModel)
    Wait(6000)

    TriggerEvent("Drilling:Start",function(success)
        if (success) then
            TriggerServerEvent('banks:server:reward', lootbox, bankInfo, fullBankInfo)
            NetworkStopSynchronisedScene(drillScene)
            DeleteObject(drillObject)
            DeleteObject(bagObject)
            RemoveAnimDict(drillModel)
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
            RemoveAnimDict(drillModel)
            RemovePtfxAsset('core')
        end
    end, bankInfo.coords)
end)

RegisterNetEvent('banks:client:LootBoxProgressBar', function(data)
    local lootbox = data.args.lootBoxIndex
    local fullBankInfo = data.args.fullBankInfo
    local bankInfo = data.args.bankInfo
    local drillItem = exports.ox_inventory:Search('count', Config.ItemRequirements.LockerDrill)
    local ptfxCoords = bankInfo.coords

    if drillItem <= 1 then
        lib.notify({
            title = 'Attention',
            description = "You don't have the right tool for this!",
            type = 'inform'
        })

        return
    end

    lib.requestNamedPtfxAsset("core")
    UseParticleFxAssetNextCall('core')
    local effect = StartParticleFxLoopedAtCoord('ent_ray_finale_vault_sparks', ptfxCoords.x, ptfxCoords.y, ptfxCoords.z, 0, 0, 0, 0x3F800000, 0, 0, 0, 0)

    if lib.progressCircle({
        duration = math.random(7500, 15000),
        useWhileDead = false,
        canCancel = true,
        disable = {
            car = true,
            move = true,
            combat = true,
        },
        anim = {
            dict = 'anim@heists@fleeca_bank@drilling',
            clip = 'drill_straight_idle'
        },
        prop = {
            model = `hei_prop_heist_drill`,
            bone = 28422,
            pos = vec3(0.00, 0, -0.01),
            rot = vec3(-220.0, 90.0, -180.0)
        },
    }) then 
        TriggerServerEvent('banks:server:reward', lootbox, bankInfo, fullBankInfo)
        StopParticleFxLooped(effect, 0)
        RemovePtfxAsset('core')
    else
        lib.notify({
            title = 'Canceled',
            description = 'Canceled',
            type = 'error'
        })
        StopParticleFxLooped(effect, 0)
    end
end)
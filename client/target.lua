RegisterNetEvent('banks:client:CreateLockerZones', function(data)
    for k, v in pairs(data.bankInfo.lockers) do
        local zone_id = exports.ox_target:addBoxZone({
            coords = v.coords,
            size = v.size,
            rotation = v.rotation,
            debug = Config.CoreInfo.Debug,
            options = {
                {
                    name = 'banks_locker_'..k,
                    event = 'banks:client:LootBoxCheck',
                    icon = 'fa-solid fa-lock',
                    iconColour = "red",
                    label = 'Break Open Locker',
                    distance = 1.5,
                    args = {
                        lootBoxIndex = k,
                        bankInfo = v,
                        fullBankInfo = data,
                    }
                },
            }
        })
        TriggerServerEvent('banks:server:UpdateZoneId', k, zone_id)
    end
end)

CreateThread(function()
    for k, v in pairs(Config.Banks) do
        local zone_id = exports.ox_target:addSphereZone({
            coords = v.vaultpanel,
            radius = 0.3,
            debug = Config.CoreInfo.Debug,
            options = {
                {
                    event = "banks:client:PanelMenu",
                    icon = "fa-solid fa-brain",
                    iconColor = "green",
                    label = "Open panel",
                    distance = 2.0,
                    args = {
                        BankIndex = k,
                        BankInfo = v,
                    }
                },
            }
        })
        TriggerServerEvent('banks:server:UpdateSecurityTable', v)
    end
end)

CreateThread(function()
    for k, v in pairs(Config.PoliceInformation.MainFrames) do
        local zone_id = exports.ox_target:addBoxZone({
            coords = v.coords,
            size = vec3(1.0, 1.0, 1.0),
            rotation = 45,
            debug = Config.CoreInfo.Debug,
            options = {
                {
                    event = 'banks:client:MainframeMenu',
                    icon = 'fa-solid fa-brain',
                    iconColor = "brown",
                    label = 'Open Police Mainframe',
                },
            }
        })
    end
end)

CreateThread(function()
    for k, v in pairs(Config.HackingDevice.HackLocations) do
        exports.ox_target:addSphereZone({
            coords = v,
            radius = 1.0,
            debug = Config.CoreInfo.Debug,
            options = {
                {
                    label = "Access database",
                    event = "banks:client:OpenHackingMenu",
                    icon = "fa-solid fa-brain",
                    iconColor = "green",
                    distance = 2.0,
                },
            }
        })
    end
end)

-- Removes zones after use
RegisterNetEvent('banks:client:RemoveZone', function(zoneId)
    exports.ox_target:removeZone(zoneId)
end)
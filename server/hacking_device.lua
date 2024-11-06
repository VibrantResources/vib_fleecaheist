RegisterNetEvent('banks:server:UploadDataToDevice', function(data)
    local player = QBCore.Functions.GetPlayer(source)
    local newDeviceMetadata = {
        attachedSoftware = data.hackToInstall,
        description = "Installed Software: "..data.hackToInstall
    }

    exports.ox_inventory:SetMetadata(source, data.device.slot, newDeviceMetadata)
    lib.notify(source, {
        title = 'Congrats',
        description = "You uploaded the software",
        type = 'success'
    })
end)

RegisterNetEvent('banks:server:RemoveDataFromDevice', function(data)
    local player = QBCore.Functions.GetPlayer(source)
    local hackingDeviceDefaultData = exports.ox_inventory:Items(data.device.name)
    local newDeviceMetadata = {
        description = hackingDeviceDefaultData.description
    }

    exports.ox_inventory:SetMetadata(source, data.device.slot, newDeviceMetadata)
    lib.notify(source, {
        title = 'Wiped',
        description = "You Wiped all data from this device",
        type = 'inform'
    })
end)
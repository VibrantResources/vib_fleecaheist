RegisterNetEvent('banks:client:OpenHackingMenu', function()
    local player = cache.ped
    local headerMenu = {}

    headerMenu[#headerMenu + 1] = {
        title = "View Data",
        description = "View available software that can be uploaded to your "..exports.ox_inventory:Items(Config.HackerItem).label,
        event = 'banks:client:ViewAvailableHacks',
        icon = 'fa-solid fa-database',
        iconColor = "yellow",
    }

    headerMenu[#headerMenu + 1] = {
        title = "Delete",
        description = "Permanently remove all attached hacking data from your "..exports.ox_inventory:Items(Config.HackerItem).label.." (This is irriversible)",
        event = 'banks:client:ViewDevicesWithSoftware',
        icon = 'fa-solid fa-database',
        iconColor = "yellow",
    }

    lib.registerContext({
        id = 'main_hacking_menu',
        title = "Hacking Data",
        options = headerMenu
    })

    lib.showContext('main_hacking_menu')
end)

RegisterNetEvent('banks:client:ViewDevicesWithSoftware', function()
    local player = cache.ped
    local hackingDevices = exports.ox_inventory:Search('slots', Config.HackerItem)
    local deletingSoftware = false
    local headerMenu = {}

    for index, deviceInfo in pairs(hackingDevices) do
        if deviceInfo.metadata.attachedSoftware then
            headerMenu[#headerMenu + 1] = {
                title = deviceInfo.label,
                description = "Installed Software: "..deviceInfo.metadata.attachedSoftware,
                event = 'banks:client:AttachHackingDevice',
                args = {
                    device = deviceInfo,
                    deletingSoftware = true,
                },
                icon = 'fa-solid fa-memory',
                iconColor = 'purple',
            }
        end
	end

    lib.registerContext({
        id = 'devices_with_data_menu',
        title = "Hacking Data",
        options = headerMenu,
        menu = 'main_hacking_menu',
    })

    lib.showContext('devices_with_data_menu')
end)

RegisterNetEvent('banks:client:ViewAvailableHacks', function()
    local player = cache.ped
    local headerMenu = {}

    for k, v in pairs(Config.HackingDevice.AvailableHackingSoftware) do
        headerMenu[#headerMenu + 1] = {
            title = v.hackName,
            description = "Attach the "..v.hackName.." software to your "..exports.ox_inventory:Items(Config.HackerItem).label,
            event = 'banks:client:ChooseHackingDeviceinput',
            args = v.hackName,
            icon = v.menuIcon,
            iconColor = "green",
        }
    end

    lib.registerContext({
        id = 'available_hacks_menu',
        title = "Hacking Data",
        options = headerMenu,
        menu = 'main_hacking_menu',
    })

    lib.showContext('available_hacks_menu')
end)

RegisterNetEvent('banks:client:ChooseHackingDeviceinput', function(hackName)
    local player = cache.ped
    local hackingDevices = exports.ox_inventory:Search('slots', Config.HackerItem)
    local displayMetadata = nil
    local headerMenu = {}

    for index, deviceInfo in pairs(hackingDevices) do
        if not deviceInfo.metadata.attachedSoftware then
            displayMetadata = "Nothing yet installed"

            headerMenu[#headerMenu + 1] = {
                title = deviceInfo.label,
                description = displayMetadata,
                event = 'banks:client:AttachHackingDevice',
                args = {
                    device = deviceInfo,
                    hackToInstall = hackName,
                },
                icon = 'fa-solid fa-memory',
                iconColor = 'purple',
            }
        end
	end

    lib.registerContext({
        id = 'choose_device_menu',
        title = "Hacking Data",
        options = headerMenu,
        menu = 'available_hacks_menu',
    })

    lib.showContext('choose_device_menu')
end)
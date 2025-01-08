RegisterNetEvent('banks:client:MainframeMenu', function()
    local playerJob = lib.callback.await('banks:server:GetPlayerJob', false)
    local code = lib.callback.await('banks:server:getmainframecode')
    local headerMenu = {}

    if not CheckPlayerJobAndType(playerJob) then
        headerMenu[#headerMenu + 1] = {
            title = "Unavailable",
            description = "You don't have access to this system",
            icon = 'fa-solid fa-code',
            iconColor = "green",
            readOnly = true
        }
    else
        if playerJob.grade.level >= 3 then
            headerMenu[#headerMenu + 1] = {
                title = "Access Code",
                description = "The current Mainframe code is: "..code,
                icon = 'fa-solid fa-code',
                iconColor = "green",
                readOnly = true
            }
        end

        headerMenu[#headerMenu + 1] = {
            title = "Camera List",
            description = "View all available cameras",
            event = 'banks:client:ViewCameraList',
            icon = 'fa-solid fa-camera',
            iconColor = "white",
            arrow = true,
        }
    end

    lib.registerContext({
        id = 'mainframe_menu',
        title = "Police Mainframe",
        options = headerMenu
    })

    lib.showContext('mainframe_menu')
end)

RegisterNetEvent('banks:client:ViewCameraList', function()
    local headerMenu = {}

    for k, v in pairs(Config.PoliceInformation.CameraList) do
        headerMenu[#headerMenu + 1] = {
            title = "Camera "..k,
            description = "This camera is for "..v.name,
            event = 'fleecaheist:client:openCameraView',
            args = k,
            icon = 'fa-solid fa-code',
            iconColor = "green",
        }
    end


    lib.registerContext({
        id = 'camera_list',
        title = "Accessible Cameras",
        options = headerMenu,
        menu = 'mainframe_menu',
    })

    lib.showContext('camera_list')
end)
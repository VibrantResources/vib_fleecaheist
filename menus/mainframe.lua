RegisterNetEvent('banks:client:MainframeMenu', function()
    local playerJob = lib.callback.await('banks:server:GetPlayerJob', false)
    local code = lib.callback.await('banks:server:getmainframecode')
    local headerMenu = {}

    if playerJob.name == Config.PoliceJob then
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
            title = "Camera Control",
            description = "View cameras",
            event = 'qb-policejob:client:OpenInput',
            icon = 'fa-solid fa-camera',
            iconColor = "white",
        }
    end

    lib.registerContext({
        id = 'mainframe_menu',
        title = "Police Mainframe",
        options = headerMenu
    })

    lib.showContext('mainframe_menu')
end)
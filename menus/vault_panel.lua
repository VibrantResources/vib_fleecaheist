RegisterNetEvent('banks:client:PanelMenu', function(data)
    local playerJob = lib.callback.await('banks:server:GetPlayerJob', false)
    local headerMenu = {}
    local bankIndex = data.args.BankIndex
    local bankInfo = data.args.BankInfo
    local bankSecurity = lib.callback.await('banks:server:GetbankSecurity', false, bankInfo.label)

    if playerJob.name == Config.PoliceJob then
        if bankSecurity.level >= Config.SecurityMaxLevel then
            headerMenu[#headerMenu + 1] = {
                title = bankInfo.label,
                description = "This banks security level can't get any higher, it's already level: "..bankSecurity.level,
                icon = 'fa-solid fa-shield',
                iconColor = "white",
                readOnly = true
            }
        else
            headerMenu[#headerMenu + 1] = {
                title = bankInfo.label,
                description = "This banks security level is currently: "..bankSecurity.level.." \n\nUpgrade it?",
                event = 'banks:client:upgradesecurity',
                args = {
                    bankInfo = bankInfo,
                },
                icon = 'fa-solid fa-shield-halved',
                iconColor = "blue",
            }
        end

        headerMenu[#headerMenu + 1] = {
            title = bankInfo.label,
            description = "Access Vault",
            onSelect = function(args)
                AccessVault(args)
            end,
            args = {
                bankInfo = bankInfo,
                bankIndex = bankIndex,
            },
            icon = 'fa-solid fa-door-closed',
            iconColor = "orange",
        }
    else
        headerMenu[#headerMenu + 1] = {
            title = bankInfo.label,
            description = "Hack security panel",
            event = 'banks:client:keypad',
            args = {
                bankInfo = bankInfo,
                bankIndex = bankIndex,
                security = bankSecurity,
            },
            icon = 'fa-solid fa-code',
            iconColor = "green",
        }
    end

    lib.registerContext({
        id = 'panel_menu',
        title = bankInfo.label,
        options = headerMenu
    })

    lib.showContext('panel_menu')
end)
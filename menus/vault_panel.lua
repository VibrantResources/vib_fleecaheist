RegisterNetEvent('banks:client:PanelMenu', function(data)
    local player = cache.ped
    local bankIndex = data.args.BankIndex
    local bankInfo = data.args.BankInfo
    local bankSecurity = lib.callback.await('banks:server:GetbankSecurity', false, bankInfo.label)
    local playerJob = lib.callback.await('banks:server:GetPlayerJob', false)
    local headerMenu = {}

    if CheckPlayerJobAndType(playerJob) then
        if bankSecurity.level >= Config.Security.MaximumLevel then
            headerMenu[#headerMenu + 1] = {
                title = "Security Rating",
                description = "This banks security level can't get any higher, it's already level: "..bankSecurity.level,
                icon = 'fa-solid fa-shield',
                iconColor = "white",
                readOnly = true
            }
        else
            headerMenu[#headerMenu + 1] = {
                title = "Security Rating",
                description = "This banks security level is currently: "..bankSecurity.level,
                event = 'banks:client:upgradesecurity',
                args = {
                    bankInfo = bankInfo,
                },
                icon = 'fa-solid fa-shield-halved',
                iconColor = "blue",
            }
        end

        headerMenu[#headerMenu + 1] = {
            title = "Vault Access",
            description = "Call a bank guard to provide access to this vault for "..bankInfo.vaultGuard.vaultAccessDurationInMinutes.." minute[s]",
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
            title = "Hack Vault Panel",
            description = "Hack this banks vault, gaining access to all the possible riches inside",
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
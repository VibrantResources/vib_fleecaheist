local bl_ui = exports.bl_ui

-- This list is for hacking into a vault panel AFTER the software is already on the hackeritem
-- You can change the value in the exports brackets to make the minigame easier or harder

function AttemptHack(hackSoftware)
    local hacks = {
        circle_progress = { fn = bl_ui.CircleProgress },
        normal_progress = { fn = bl_ui.Progress },
        key_spam       = { fn = bl_ui.KeySpam },
        key_circle     = { fn = bl_ui.KeyCircle, extra = 3 },
        number_slide   = { fn = bl_ui.NumberSlide, extra = 3 },
        rapid_lines    = { fn = bl_ui.RapidLines, extra = 3 },
        circle_shake   = { fn = bl_ui.CircleShake, extra = 3 },
    }

    local chosenHack = hacks[hackSoftware]
    if not chosenHack then
        return false
    end

    local option1 = math.random(3, 5)
    local option2 = math.random(50, 100)
    if chosenHack.extra then
        return chosenHack.fn(bl_ui, option1, option2, chosenHack.extra)
    else
        return chosenHack.fn(bl_ui, option1, option2)
    end
end

RegisterNetEvent('banks:client:AttachHackingDevice', function(data)
    local player = cache.ped

    if lib.progressCircle({
        duration = 1000,
        label = "Linking in device",
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
    }) then 
        if not data.deletingSoftware then
            TriggerEvent('banks:client:AttemptToUploadSoftwareToDevice', data)
        else
            TriggerServerEvent('banks:server:RemoveDataFromDevice', data)
        end
    else
        lib.notify({
            title = 'Canceled',
            description = 'Canceled',
            type = 'error'
        })
    end
end)
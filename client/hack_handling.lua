local bl_ui = exports.bl_ui

-- This list is for hacking into a vault panel AFTER the software is already on the hackeritem
-- You can change the value in the exports brackets to make the minigame easier or harder

function AttemptHack(data)
    if data.metadata.attachedSoftware == "circle_progress" then
        local success = bl_ui:CircleProgress(math.random(3, 5), math.random(50, 100))
        
        return success
    end

    if data.metadata.attachedSoftware == "normal_progress" then
        local success = bl_ui:Progress(math.random(3, 5), math.random(50, 100))

        return success
    end

    if data.metadata.attachedSoftware == "key_spam" then
        local success = bl_ui:KeySpam(math.random(3, 5), math.random(50, 100))

        return success
    end
    
    if data.metadata.attachedSoftware == "key_circle" then
        local success = bl_ui:KeyCircle(math.random(3, 5), math.random(50, 100), 3)

        return success
    end

    if data.metadata.attachedSoftware == "number_slide" then
        local success = bl_ui:NumberSlide(math.random(3, 5), math.random(50, 100), 3)

        return success
    end

    if data.metadata.attachedSoftware == "rapid_lines" then
        local success = bl_ui:RapidLines(math.random(3, 5), math.random(50, 100), 3)

        return success
    end

    if data.metadata.attachedSoftware == "circle_shake" then
        local success = bl_ui:CircleShake(math.random(3, 5), math.random(50, 100), 3)

        return success
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
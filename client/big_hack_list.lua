local bl_ui = exports.bl_ui

-- This list is for uploading software to a hackeritem
-- You can change the value in the exports brackets to alter the variables of the minigames
-- Details for the minigames can be found in BL's documentation, with a link in our README

RegisterNetEvent('banks:client:AttemptToUploadSoftwareToDevice', function(data)
    local player = cache.ped
    local success = nil

    if data.hackToInstall == "circle_progress" then
        success = bl_ui:CircleProgress(2,2)
    end

    if data.hackToInstall == "normal_progress" then
        success = bl_ui:Progress(math.random(3, 5), math.random(50, 100))
    end

    if data.hackToInstall == "key_spam" then
        success = bl_ui:KeySpam(math.random(3, 5), math.random(50, 100))
    end
    
    if data.hackToInstall == "key_circle" then
        success = bl_ui:KeyCircle(math.random(3, 5), math.random(50, 100), 3)
    end

    if data.hackToInstall == "number_slide" then
        success = bl_ui:NumberSlide(math.random(3, 5), math.random(50, 100), 3)
    end

    if data.hackToInstall == "rapid_lines" then
        success = bl_ui:RapidLines(math.random(3, 5), math.random(50, 100), 3)
    end

    if data.hackToInstall == "circle_shake" then
        success = bl_ui:CircleShake(math.random(3, 5), math.random(50, 100), 3)
    end

    if success then
        TriggerServerEvent('banks:server:UploadDataToDevice', data)
    else
        lib.notify({
            title = 'Failed',
            description = "You failed to upload the hacking software",
            type = 'error'
        })
    end
end)
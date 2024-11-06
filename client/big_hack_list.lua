local bl_ui = exports.bl_ui

--Change the values in each minigame to suit your server difficulty

RegisterNetEvent('banks:client:AttemptToUploadSoftwareToDevice', function(data)
    local player = cache.ped

    if data.hackToInstall == "circle_progress" then
        local success = bl_ui:CircleProgress(math.random(3, 5), math.random(35, 100))
        
        if success then
            TriggerServerEvent('banks:server:UploadDataToDevice', data)
        else
            lib.notify({
                title = 'Failed',
                description = "You failed to upload the hacking software",
                type = 'error'
            })

            return
        end
    end

    if data.hackToInstall == "normal_progress" then
        local success = bl_ui:Progress(math.random(3, 5), math.random(50, 100))

        if success then
            TriggerServerEvent('banks:server:UploadDataToDevice', data)
        else
            lib.notify({
                title = 'Failed',
                description = "You failed to upload the hacking software",
                type = 'error'
            })

            return
        end
    end

    if data.hackToInstall == "key_spam" then
        local success = bl_ui:KeySpam(math.random(3, 5), math.random(50, 100))

        if success then
            TriggerServerEvent('banks:server:UploadDataToDevice', data)
        else
            lib.notify({
                title = 'Failed',
                description = "You failed to upload the hacking software",
                type = 'error'
            })

            return
        end
    end
    
    if data.hackToInstall == "key_circle" then
        local success = bl_ui:KeyCircle(math.random(3, 5), math.random(50, 100), 3)

        if success then
            TriggerServerEvent('banks:server:UploadDataToDevice', data)
        else
            lib.notify({
                title = 'Failed',
                description = "You failed to upload the hacking software",
                type = 'error'
            })

            return
        end
    end

    if data.hackToInstall == "number_slide" then
        local success = bl_ui:NumberSlide(math.random(3, 5), math.random(50, 100), 3)

        if success then
            TriggerServerEvent('banks:server:UploadDataToDevice', data)
        else
            lib.notify({
                title = 'Failed',
                description = "You failed to upload the hacking software",
                type = 'error'
            })

            return
        end
    end

    if data.hackToInstall == "rapid_lines" then
        local success = bl_ui:RapidLines(math.random(3, 5), math.random(50, 100), 3)

        if success then
            TriggerServerEvent('banks:server:UploadDataToDevice', data)
        else
            lib.notify({
                title = 'Failed',
                description = "You failed to upload the hacking software",
                type = 'error'
            })

            return
        end
    end

    if data.hackToInstall == "circle_shake" then
        local success = bl_ui:CircleShake(math.random(3, 5), math.random(50, 100), 3)

        if success then
            TriggerServerEvent('banks:server:UploadDataToDevice', data)
        else
            lib.notify({
                title = 'Failed',
                description = "You failed to upload the hacking software",
                type = 'error'
            })

            return
        end
    end
end)
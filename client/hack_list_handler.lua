local bl_ui = exports.bl_ui

function InteractWithHackingList(data)
    local hackInUse = ""

    if data.hackToInstall then
        hackInUse = data.hackToInstall
    else
        hackInUse = data
    end

    local hacks = {
        circle_progress = { fn = bl_ui.CircleProgress, args = {2, 2} },
        normal_progress = { fn = bl_ui.Progress,      args = {"rand1", "rand2"} },
        key_spam        = { fn = bl_ui.KeySpam,       args = {"rand1", "rand2"} },
        key_circle      = { fn = bl_ui.KeyCircle,     args = {"rand1", "rand2", 3} },
        number_slide    = { fn = bl_ui.NumberSlide,   args = {"rand1", "rand2", 3} },
        rapid_lines     = { fn = bl_ui.RapidLines,    args = {"rand1", "rand2", 3} },
        circle_shake    = { fn = bl_ui.CircleShake,   args = {"rand1", "rand2", 3} },
    }

    local chosenHack = hacks[hackInUse]
    local success = false

    if chosenHack then
        local option1 = math.random(3, 5)
        local option2 = math.random(50, 100)

        local args = {}
        for k, v in ipairs(chosenHack.args) do
            if v == "rand1" then
                args[k] = option1
            elseif v == "rand2" then
                args[k] = option2
            else
                args[k] = v
            end
        end

        success = chosenHack.fn(bl_ui, table.unpack(args))
    end

    if success then
        if data.hackToInstall then
            TriggerServerEvent('banks:server:UploadDataToDevice', data)
        else
            return true
        end
    else
        if data.hackToInstall then
            lib.notify({
                title = 'Failed',
                description = "You failed to upload the hacking software",
                type = 'error'
            })
        end

        return false
    end
end
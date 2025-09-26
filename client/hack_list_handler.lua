local bl_ui = exports.bl_ui

--[[  
    Shared hack registry
    Use RegisterHack("hackName", bl_ui.FunctionName, {"rand1", "rand2", 3})  
    - "rand1" and "rand2" will automatically be replaced with random values:
        rand1 = math.random(3, 5)
        rand2 = math.random(50, 100)
    - Any other values are passed as-is.
--]]

local HacksConfig = {}

function RegisterHack(name, fn, args)
    HacksConfig[name] = { fn = fn, args = args }
end

-- Pre-register your hacks here:
RegisterHack("circle_progress", bl_ui.CircleProgress, {2, 2})
RegisterHack("normal_progress", bl_ui.Progress, {"rand1", "rand2"})
RegisterHack("key_spam", bl_ui.KeySpam, {"rand1", "rand2"})
RegisterHack("key_circle", bl_ui.KeyCircle, {"rand1", "rand2", 3})
RegisterHack("number_slide", bl_ui.NumberSlide, {"rand1", "rand2", 3})
RegisterHack("rapid_lines", bl_ui.RapidLines, {"rand1", "rand2", 3})
RegisterHack("circle_shake", bl_ui.CircleShake, {"rand1", "rand2", 3})

-- Main interaction function
function InteractWithHackingList(data)
    local hackInUse = data.hackToInstall or data
    local chosenHack = HacksConfig[hackInUse]
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
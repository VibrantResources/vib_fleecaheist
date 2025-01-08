RegisterNetEvent('banks:client:CloseDoor', function(data)
    local object = GetClosestObjectOfType(data.vaultpanel.x, data.vaultpanel.y, data.vaultpanel.z, 5.0, data.vaultDoorObject, false, false, false)
    local doorHeading = data.heading.open
    local bankSecurity = lib.callback.await('banks:server:GetbankSecurity', false, data.label)

    if object ~= 0 then
        CreateThread(function()
            while doorHeading ~= data.heading.closed do
                if doorHeading > 360.0 then
                    doorHeading = 0.0
                end
                SetEntityHeading(object, doorHeading + 0.05)
                doorHeading += 0.05

                if doorHeading >= data.heading.closed then
                    return
                end
                
                Wait(1)
            end
        end)
    end
end)

RegisterNetEvent('banks:client:OpenDoor', function(data)
    local object = GetClosestObjectOfType(data.vaultpanel.x, data.vaultpanel.y, data.vaultpanel.z, 5.0, data.vaultDoorObject, false, false, false)
    local doorHeading = data.heading.closed
    local bankSecurity = lib.callback.await('banks:server:GetbankSecurity', false, data.label)

    if object ~= 0 then
        CreateThread(function()
            while doorHeading ~= data.heading.open do
                SetEntityHeading(object, doorHeading - 0.05)
                doorHeading -= 0.05


                if doorHeading <= data.heading.open then
                    return
                end

                Wait(1)
            end
        end)
    end
end)
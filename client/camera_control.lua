local cameraID = 0

local function ButtonMessage(text)
    BeginTextCommandScaleformString("STRING")
    AddTextComponentScaleform(text)
    EndTextCommandScaleformString()
end

local function Button(ControlButton)
    N_0xe83a3e3557a56640(ControlButton)
end

function InstructionalButtonsCamera(scaleform)
    local scaleform = RequestScaleformMovie(scaleform)
    
    while not HasScaleformMovieLoaded(scaleform) do
        Citizen.Wait(0)
    end
    BeginScaleformMovieMethod(scaleform, "CLEAR_ALL")
    PopScaleformMovieFunctionVoid()
  
    BeginScaleformMovieMethod(scaleform, "SET_CLEAR_SPACE")
    PushScaleformMovieFunctionParameterInt(200)
    PopScaleformMovieFunctionVoid()

    BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT")
    PushScaleformMovieFunctionParameterInt(0)
    Button(GetControlInstructionalButton(2, 174, true))
    ButtonMessage("LEFT")
    PopScaleformMovieFunctionVoid()

    BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT")
    PushScaleformMovieFunctionParameterInt(1)
    Button(GetControlInstructionalButton(2, 175, true))
    ButtonMessage("RIGHT")
    PopScaleformMovieFunctionVoid()

    BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT")
    PushScaleformMovieFunctionParameterInt(2)
    Button(GetControlInstructionalButton(2, 172, true))
    ButtonMessage("UP")
    PopScaleformMovieFunctionVoid()

    BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT")
    PushScaleformMovieFunctionParameterInt(3)
    Button(GetControlInstructionalButton(2, 173, true))
    ButtonMessage("DOWN")
    PopScaleformMovieFunctionVoid()

    BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT")
    PushScaleformMovieFunctionParameterInt(4)
    Button(GetControlInstructionalButton(2, 178, true)) -- The button to display
    ButtonMessage("EXIT") -- the message to display next to it
    PopScaleformMovieFunctionVoid()

    BeginScaleformMovieMethod(scaleform, "DRAW_INSTRUCTIONAL_BUTTONS")
    PopScaleformMovieFunctionVoid()

    BeginScaleformMovieMethod(scaleform, "SET_BACKGROUND_COLOUR")
    PushScaleformMovieFunctionParameterInt(0)
    PushScaleformMovieFunctionParameterInt(0)
    PushScaleformMovieFunctionParameterInt(0)
    PushScaleformMovieFunctionParameterInt(80)
    PopScaleformMovieFunctionVoid()

    return scaleform
end

RegisterNetEvent('fleecaheist:client:openCameraView', function(data)
    local cameraNumber = data
	local currentCamera = Config.PoliceInformation.CameraList[cameraNumber]
	local x, y, z, heading = currentCamera.location.x, currentCamera.location.y, currentCamera.location.z, currentCamera.w

	usingCamera = true
	SetTimecycleModifier('CCTV_overlay01') -- Check [https://wiki.rage.mp/index.php?title=Timecycle_Modifiers] for more modifiers
	SetTimecycleModifierStrength(0.7)
	local scaleForm = RequestScaleformMovie('MP_BIG_MESSAGE_FREEMODE')

	while not HasScaleformMovieLoaded(scaleForm) do
		Citizen.Wait(0)
	end

	cameraID = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)
	SetCamCoord(cameraID, x, y, (z+1.25))						
	SetCamRot(cameraID, -13.0, 0.0, heading)
	SetCamFov(cameraID, 105.0)
	RenderScriptCams(true, false, 0, 1, 0)
	BeginScaleformMovieMethod(scaleForm, 'PLAY_CAM_MOVIE')
	SetFocusArea(x, y, z, 0.0, 0.0, 0.0)
	PopScaleformMovieFunctionVoid()

	while usingCamera do
		SetCamCoord(cameraID, x, y, (z+1.25))
		BeginScaleformMovieMethod(scaleForm, 'SET_ALT_FOV_HEADING')
		PushScaleformMovieFunctionParameterFloat(GetEntityCoords(heading).z)
		PushScaleformMovieFunctionParameterFloat(1.0)
		PushScaleformMovieFunctionParameterFloat(GetCamRot(cameraID, 2).z)
		PopScaleformMovieFunctionVoid()
		DrawScaleformMovieFullscreen(scaleForm, 255, 255, 255, 255)
		Citizen.Wait(1)
	end

	ClearFocus()
	ClearTimecycleModifier()
	RenderScriptCams(false, false, 0, 1, 0) -- Return to gameplay camera
	SetScaleformMovieAsNoLongerNeeded(scaleForm) -- Cleanly release the scaleform
	DestroyCam(cameraID, false)
	SetNightvision(false)
	SetSeethrough(false)
end)

CreateThread(function()
    while true do
        Citizen.Wait(1)
        local sleep = true
        if usingCamera then
            sleep = false
            local camForm = InstructionalButtonsCamera("instructional_buttons")
            local camRotation = GetCamRot(cameraID, 2)
            local player = cache.ped

            DrawScaleformMovieFullscreen(camForm, 255, 255, 255, 255)
            if IsControlPressed(0, 174) then -- arrow left
                SetCamRot(cameraID, camRotation.x, 0.0, (camRotation.z+0.35), 2)
            end

            if IsControlPressed(0, 175) then -- arrow right
                SetCamRot(cameraID, camRotation.x, 0.0, (camRotation.z-0.35), 2)
            end

            if IsControlPressed(0, 172) then -- arrow up
                SetCamRot(cameraID, (camRotation.x+0.35), 0.0, camRotation.z, 2)
            end

            if IsControlPressed(0, 173) then -- arrow down
                SetCamRot(cameraID, (camRotation.x-0.35), 0.0, camRotation.z, 2)
            end

            if IsControlPressed(0, 178) then -- delete
                usingCamera = false
                Wait(500)
                ClearPedTasks(player)
                DeleteObject(tabletObject)
                SetCurrentPedWeapon(player, GetHashKey("WEAPON_UNARMED"), true)

                Citizen.Wait(500)
            end
        end
        if sleep then 
            Citizen.Wait(1000) 
        end
    end
end)
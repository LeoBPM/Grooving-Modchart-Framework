-- Shading Extension for Grooving Modchart Framework
-- Inspired in Nick's and Santex Shading Tool
-- by : Leo_BPM
-- Version = '1.0'

local registeredShaders = {}
local cameraShaders = {
    camGame = {},
    camHUD = {},
}

local wavyAct = false
local curveAct = false
local vignetteAct = false
local rainAct = false
local cineAct = false
local chromaticAct = false
local flaresAct = false
local contrastAct = false
local grainAct = false
local toneAct = false
local pixelAct = false
local glitchAct = false
local gameboyAct = false
local saturationAct = false
local hueAct = false
local spscAct = false
local pinchAct = false
local bulgeAct = false
local camProAct = false
local brightAct = false
local cineGameAct = false

function onCreatePost()
    makeLuaSprite('AngleCam', '', 0, 0) -- work X and Y

    makeLuaSprite('WaveInt', '', 0, 0)
    makeLuaSprite('WaveSPD', '', 0, 0)
    makeLuaSprite('WaveRate', '', 0, 0)

    makeLuaSprite('Vignette', '', 0, 0)

    makeLuaSprite('Chromatic', '', 0, 0) -- chroma strength

    makeLuaSprite('Flares', '', 0, 0) --x

    makeLuaSprite('Contrast', '', 0, 0)--x 

    makeLuaSprite('FilmGrain', '', 0, 0)--x 

    makeLuaSprite('ToneMap', '', 0, 0)--x

    makeLuaSprite('Pixel', '', 0, 0)--x

    makeLuaSprite('Glitch', '', 0, 0)
    makeLuaSprite('GlitchRecept', '', 0, 0)

    makeLuaSprite('GB', '', 0, 0)

    makeLuaSprite('Saturation', '', 0, 0)

    makeLuaSprite('HUE', '', 0, 0)

    makeLuaSprite('SplitScreen', '', 0, 0)

    makeLuaSprite('Pinch' , '', 0, 0)

    makeLuaSprite('BulgeSc', '', 0, 0)

    makeLuaSprite('camPro', '', 0, 0)
    makeLuaSprite('camProZoom', '', 100, 0)

    makeLuaSprite('Brightness', '', 0, 0)

    makeLuaSprite('CinematicHUD', '', 0, 0)
    makeLuaSprite('CinematicGame', '', 0, 0)
    makeBars()

    aea()
end

function onCreate()
    shaderCoordFix()
end

function makeBars()
    local barHeight = 1
    local barWidth = 1
    local newWidth = (screenWidth)*1.5
    local newHeight = (screenHeight)*1.5

    -- ========== (Top y Bottom) ========== --

    makeLuaSprite('blackBarTop', nil, 0, -barHeight)
    makeGraphic('blackBarTop', newWidth, barHeight, '000000')
    setObjectCamera('blackBarTop', 'camHUD')

    setProperty('blackBarTop.origin.x', newWidth / 2)
    setProperty('blackBarTop.origin.y', barHeight / 2)

    setProperty('blackBarTop.x', -newWidth/5)
    setProperty('blackBarTop.y', (screenHeight/2) - (screenHeight/2) - 150 + barHeight)

    setProperty('blackBarTop.scale.y', 0)
    addLuaSprite('blackBarTop', false)

    makeLuaSprite('blackBarBottom', nil, 0, screenHeight)
    makeGraphic('blackBarBottom', newWidth, barHeight, '000000')
    setObjectCamera('blackBarBottom', 'camHUD')

    setProperty('blackBarBottom.origin.x', newWidth / 2)
    setProperty('blackBarBottom.origin.y', barHeight / 2)

    setProperty('blackBarBottom.x', -newWidth/5)
    setProperty('blackBarBottom.y', (screenHeight/2) + (screenHeight/2) + 150 - barHeight)
    setProperty('blackBarBottom.offset.y', -barHeight)

    setProperty('blackBarBottom.scale.y', 0)
    addLuaSprite('blackBarBottom', false)

    -- ========== (Left y Right) ========== --
    makeLuaSprite('blackBarLeft', nil, -barWidth, 0)
    makeGraphic('blackBarLeft', barWidth, newHeight, '000000')
    setObjectCamera('blackBarLeft', 'camHUD')

    setProperty('blackBarLeft.origin.x', barWidth / 2)
    setProperty('blackBarLeft.origin.y', newHeight / 2)

    setProperty('blackBarLeft.x', (screenWidth/2) - (screenWidth/2) - 150 + barWidth)
    setProperty('blackBarLeft.y', -newHeight/6)

    setProperty('blackBarLeft.scale.x', 0)
    addLuaSprite('blackBarLeft', false)

    makeLuaSprite('blackBarRight', nil, screenWidth, 0)
    makeGraphic('blackBarRight', barWidth, newHeight, '000000')
    setObjectCamera('blackBarRight', 'camHUD')

    setProperty('blackBarRight.origin.x', barWidth / 2)
    setProperty('blackBarRight.origin.y', newHeight / 2)

    setProperty('blackBarRight.x', (screenWidth/2) + (screenWidth/2) + 150 - barWidth)
    setProperty('blackBarRight.y', -newHeight/6)
    setProperty('blackBarRight.offset.x', -barWidth)

    setProperty('blackBarRight.scale.x', 0)
    addLuaSprite('blackBarRight', false)
end

function onUpdate(elapsed)
    local waveIntX = getProperty('WaveInt.x')
    local waveIntY = getProperty('WaveInt.y')
    local curveX = getProperty('cMultiAng.x')
    local curveY = getProperty('cMultiAng.y')
    local vignetteX = getProperty('Vignette.x')
    local vignetteY = getProperty('Vignette.y')
    local chroma = getProperty('Chromatic.x')
    local grain = getProperty('FilmGrain.x')
    local flr = getProperty('Flares.x')
    local ctr = getProperty('Contrast.x')
    local tone = getProperty('ToneMap.x')
    local pixel = getProperty('Pixel.x')
    local glitch = getProperty('Glitch.x')
    local gameboy = getProperty('GB.x')
    local saturation = getProperty('Saturation.x')
    local hue = getProperty('HUE.x')
    local spscX = getProperty('SplitScreen.x')
    local spscY = getProperty('SplitScreen.y')
    local pinch = getProperty('Pinch.x')
    local bulge = getProperty('BulgeSc.x')
    local bulgeRad = getProperty('BulgeSc.y')
    local XcamPro = getProperty('camPro.x')
    local YcamPro = getProperty('camPro.y')
    local ZoomcamPro = getProperty('camProZoom.x')
    local AngcamPro = getProperty('camPro.angle')
    local bright = getProperty('Brightness.x')
    local barGameY = getProperty('CinematicGame.y')
    local barGameX = getProperty('CinematicGame.x')
    
    if (waveIntX ~= 0 or waveIntY ~= 0) and not wavyAct then
        AddNewShader("wavy", "soo weird", {"camGame", "camHUD"})
        wavyAct = true
    elseif waveIntX == 0 and waveIntY == 0 and wavyAct then
        RemoveShader("wavy", {"camGame", "camHUD"})
        wavyAct = false
    end
    if wavyAct then
        ManageShader("wavy", "iTime", os.clock())
        ManageShader("wavy", "Xspeed", getProperty('WaveSPD.x'))
        ManageShader("wavy", "Yspeed", getProperty('WaveSPD.y'))
        ManageShader("wavy", "XRate", getProperty('WaveRate.x'))
        ManageShader("wavy", "YRate", getProperty('WaveRate.y'))
        ManageShader("wavy", "axisX", waveIntX/1000)
        ManageShader("wavy", "axisY", waveIntY/1000)
    end

    if (curveX ~= 0 or curveY ~= 0) and not curveAct then
        AddNewShader("curve", "curve", {"camHUD"})
        curveAct = true
    elseif curveX == 0 and curveY == 0 and curveAct then
        RemoveShader("curve", {"camHUD"})
        curveAct = false
    end
    if curveAct then
        ManageShader("curve", "curveX", curveX/100)
        ManageShader("curve", "curveY", curveY/100)
    end

    if vignetteX ~= 0 and not vignetteAct then
        AddNewShader("vignette", "vignette", {"camHUD"})
        vignetteAct = true
    elseif vignetteX == 0 and vignetteAct then
        RemoveShader("vignette", {"camHUD"})
        vignetteAct = false
    end
    if vignetteAct then
        ManageShader("vignette", "Intensity", vignetteX * 10)
        ManageShader("vignette", "Size", vignetteY/10)
    end

    if chroma ~= 0 and not chromaticAct then
        AddNewShader("chromatic", "chromatic", {"camGame","camHUD"})
        chromaticAct = true
    elseif chroma == 0 and chromaticAct then
        RemoveShader("chromatic", {"camGame","camHUD"})
        chromaticAct = false
    end
    if chromaticAct then
        ManageShader("chromatic", "Xamount", chroma)
    end

    if grain ~= 0 and not grainAct then
        AddNewShader("grain", "grain", {"camGame","camHUD"})
        grainAct = true
    elseif grain == 0 and grainAct then
        RemoveShader("grain", {"camGame","camHUD"})
        grainAct = false
    end
    if grainAct then
        setShaderFloat("grain", "iTime", os.clock())
        ManageShader("grain", "strength", grain)
    end

    if flr ~= 0 and not flaresAct then
        AddNewShader("flares", "flares", {"camGame","camHUD"})
        flaresAct = true
    elseif flr == 0 and flaresAct then
        RemoveShader("flares", {"camGame","camHUD"})
        flaresAct = false
    end
    if flaresAct then
        ManageShader("flares", 'strength', flr)
    end

    if ctr ~= 0 and not contrastAct then
        AddNewShader("contrast", "contrast", {"camGame","camHUD"})
        contrastAct = true
    elseif ctr == 0 and contrastAct then
        RemoveShader("contrast", {"camGame","camHUD"})
        contrastAct = false
    end
    if contrastAct then
        ManageShader("contrast", "strength", ctr)
    end

    if tone ~= 0 and not toneAct then
        AddNewShader("toneHUD", "aces", {"camHUD"})
        AddNewShader("toneGame", "aces", {"camGame"})
        toneAct = true
    elseif tone == 0 and toneAct then
        RemoveShader("toneHUD", {"camHUD"})
        RemoveShader("toneGame", {"camGame"})
        toneAct = false
    end
    if toneAct then
        ManageShader("toneHUD", 'power', tone)
        ManageShader("toneGame", 'power', tone/4)
    end

    if pixel ~= 0 and not pixelAct then
        AddNewShader("pixel", "pixel", {"camHUD", "camGame"})
        pixelAct = true
    elseif pixel == 0 and pixelAct then
        RemoveShader("pixel", {"camHUD", "camGame"})
        pixelAct = false
    end
    if pixelAct then
        setShaderFloat("pixel", "iTime", os.clock())
        ManageShader("pixel", 'size', pixel/20)
    end

    if glitch ~= 0 and not glitchAct then
        AddNewShader("glitch", "glitch", {"camHUD", "camGame"})
        glitchAct = true
    elseif glitch == 0 and glitchAct then
        RemoveShader("glitch", {"camHUD", "camGame"})
        glitchAct = false
    end
    if glitchAct then
        setShaderFloat("glitch", "iTime", os.clock())
        ManageShader("glitch", 'intensity', (glitch/1000)*getProperty('GlitchRecept.x'))
        setProperty('GlitchRecept.x', getRandomInt(1, -1))
    end

    if gameboy ~= 0 and not gameboyAct then
        AddNewShader("gameboy", "gameboy", {"camHUD", "camGame"})
        gameboyAct = true
    elseif gameboy == 0 and gameboyAct then
        RemoveShader("gameboy", {"camHUD", "camGame"})
        gameboyAct = false
    end
    if gameboyAct then
        setShaderFloat("gameboy", "iTime", os.clock())
    end

    if saturation ~= 0 and not saturationAct then
        AddNewShader("saturation", "saturation", {"camHUD", "camGame"})
        saturationAct = true
    elseif saturation == 0 and saturationAct then
        RemoveShader("saturation", {"camHUD", "camGame"})
        saturationAct = false
    end
    if saturationAct then
        if saturation > 0 then
            ManageShader("saturation", 'sat', saturation/10)
        elseif saturation < 0 then
            ManageShader("saturation", 'sat', saturation/100)
        end
    end

    if hue ~= 0 and not hueAct then
        AddNewShader("hue", "hue", {"camHUD", "camGame"})
        hueAct = true
    elseif hue == 0 and hueAct then
        RemoveShader("hue", {"camHUD", "camGame"})
        hueAct = false
    end
    if hueAct then
        ManageShader("hue", 'hue', hue)
    end

    if (spscX ~= 0 or spscY ~= 0) and not spscAct then
        AddNewShader("spsc", "splitscreen", {"camHUD"})
        spscAct = true
    elseif spscX == 0 and spscY == 0 and spscAct then
        RemoveShader("spsc", {"camHUD"})
        spscAct = false
    end
    if spscAct then
        ManageShader("spsc", "targetX", spscX)
        ManageShader("spsc", "targetY", spscY)
    end

    if pinch ~= 0 and not pinchAct then
        AddNewShader("pinch", "pinch", {"camHUD"})
        pinchAct = true
    elseif pinch == 0 and pinchAct then
        RemoveShader("pinch", {"camHUD"})
        pinchAct = false
    end
    if pinchAct then
        ManageShader("pinch", "intensity", pinch/10)
        setShaderFloat("pinch", "iTime", os.clock())
    end

    if bulge ~= 0 and not bulgeAct then
        AddNewShader("bulge", "bulge", {"camHUD"})
        bulgeAct = true
    elseif bulge == 0 and bulgeAct then
        RemoveShader("bulge", {"camHUD"})
        bulgeAct = false
    end
    if bulgeAct then
        ManageShader("bulge", "strength", bulge/10)
        setShaderFloat("bulge", "radius", bulgeRad/10)
    end

    if (XcamPro ~= 0 or YcamPro ~= 0 or ZoomcamPro ~= 0 or AngcamPro ~= 0) and not camProAct then
        AddNewShader("camPro", "visualcompensation", {"camHUD"})
        camProAct = true
    elseif XcamPro ~= 0 and YcamPro ~= 0 and ZoomcamPro ~= 0 and AngcamPro ~= 0 and camProAct then
        RemoveShader("camPro", {"camHUD"})
        camProAct = false
    end
    if camProAct then
        ManageShader("camPro", "xPos", XcamPro/10)
        ManageShader("camPro", "yPos", YcamPro/10)
        ManageShader("camPro", "zoom", ZoomcamPro/100)
        ManageShader("camPro", "ang", AngcamPro)
    end

    if bright ~= 0 and not brightAct then
        AddNewShader("brightness", "brightness", {"camHUD", "camGame"})
        brightAct = true
    elseif bright == 0 and brightAct then
        RemoveShader("brightness", {"camHUD", "camGame"})
        brightAct = false
    end
    if brightAct then
        ManageShader("brightness", "brightness", bright)
    end

    local barSizeY = getProperty('CinematicHUD.y')
    if barSizeY ~= nil then
        setProperty('blackBarTop.scale.y', barSizeY * 2)
        setProperty('blackBarBottom.scale.y', barSizeY * 2)
    end

    local barSizeX = getProperty('CinematicHUD.x')
    if barSizeX ~= nil then
        setProperty('blackBarRight.scale.x', barSizeX * 2)
        setProperty('blackBarLeft.scale.x', barSizeX * 2)
    end

    if (barGameY ~= 0 or barGameX ~= 0) and not cineGameAct then
        AddNewShader("cineGame", "cinematic", {"camGame"})
        cineGameAct = true
    elseif barGameY == 0 and barGameX == 0 and cineGameAct then
        RemoveShader("cineGame", {"camGame"})
        cineGameAct = false
    end
    if cineGameAct then
        ManageShader("cineGame", "barSizeY", (barGameY / 720) * 2)
        ManageShader("cineGame", "barSizeX", (barGameX / 1280) * 2)
    end

    -- Template for new shaders

    --if shaderInt ~= 0 and not shaderAct then
    --    AddNewShader("shader_name", "shader.frag/.vert", {"camHUD", "camGame"})
    --    shaderAct = true
    --elseif shaderInt == 0 and shaderAct then
    --    RemoveShader("shader_name", {"camHUD", "camGame"})
    --    shaderAct = false
    --end
    --if shaderAct then
    --    ManageShader("shader_name", "Shader_uniform-Float", shaderInt)
    --end
end

-- ============================
-- ===== CUSTOM FUNCTIONS =====
-- ============================

function AddNewShader(name, file, cameras)
    if type(cameras) == "string" then
        cameras = {cameras}
    end

    if not registeredShaders[name] then
        runHaxeCode([[
            game.initLuaShader("]]..file..[[");
            game.variables["shader_]]..name..[["] = game.createRuntimeShader("]]..file..[[");
        ]])
        
        registeredShaders[name] = {
            file = file,
            cameras = {}
        }
        
        --debugPrint("Shader aded: " .. name .. " (" .. file .. ")")
    end

    for _, cam in ipairs(cameras) do
        if not cameraShaders[cam] then
            --debugPrint("Ivalid Camera: " .. cam)
        else
            -- add if not exist in that camera
            local alreadyExists = false
            for _, existingName in ipairs(cameraShaders[cam]) do
                if existingName == name then
                    alreadyExists = true
                    break
                end
            end
            
            if not alreadyExists then
                table.insert(cameraShaders[cam], name)
                registeredShaders[name].cameras[cam] = true
                --debugPrint("Shader '"..name.."' aded to "..cam)
            end
        end
    end

    for _, cam in ipairs(cameras) do
        refreshCamera(cam)
    end
end

function RemoveShader(name, cameras)
    if not registeredShaders[name] then
        debugPrint("Shader not found : " .. name)
        return
    end

    if type(cameras) == "string" then
        cameras = {cameras}
    end
    
    -- Remove from an especific camera
    for _, cam in ipairs(cameras) do
        if cameraShaders[cam] then
            -- search shader to remove
            for i, shaderName in ipairs(cameraShaders[cam]) do
                if shaderName == name then
                    table.remove(cameraShaders[cam], i)
                    registeredShaders[name].cameras[cam] = nil
                    --debugPrint(" Shader '"..name.."' removed from "..cam)
                    break
                end
            end

            refreshCamera(cam)
        end
    end
end

function ManageShader(name, property, value)
    if not registeredShaders[name] then
        --debugPrint("Shader doesn't exist: " .. name)
        return
    end
    
    runHaxeCode([[
        if (game.variables["shader_]]..name..[["] != null) {
            game.variables["shader_]]..name..[["].setFloat("]]..property..[[", ]]..value..[[);
        }
    ]])
end

function refreshCamera(camera)
    if not cameraShaders[camera] then return end
    
    local filterList = {}

    -- Array camera shit
    for _, name in ipairs(cameraShaders[camera]) do
        table.insert(filterList, 'new ShaderFilter(game.variables["shader_'..name..'"])')
    end
    
    local filters = table.concat(filterList, ",")
    
    if filters == "" then
        -- clean
        runHaxeCode([[
            game.]]..camera..[[.setFilters([]);
        ]])
    else
        runHaxeCode([[
            game.]]..camera..[[.setFilters([]]..filters..[[]);
        ]])
    end

    --debugPrint("Updated: "..camera.." ("..#cameraShaders[camera].." shaders)")
end

function shaderCoordFix()
    runHaxeCode([[
        resetCamCache = function(?spr) {
            if (spr == null || spr.filters == null) return;
            spr.__cacheBitmap = null;
            spr.__cacheBitmapData = null;
        }
        
        fixShaderCoordFix = function(?_) {
            resetCamCache(game.camGame.flashSprite);
            resetCamCache(game.camHUD.flashSprite);
            resetCamCache(game.camOther.flashSprite);
        }
    
        FlxG.signals.gameResized.add(fixShaderCoordFix);
        fixShaderCoordFix();
        return;
    ]])
    
    local temp = onDestroy
    function onDestroy()
        runHaxeCode([[
            FlxG.signals.gameResized.remove(fixShaderCoordFix);
            return;
        ]])
        if (temp) then temp() end
    end
end
--╭━━━╮╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╭━╮╭━╮╱╱╱╱╭╮╱╱╭╮╱╱╱╱╱╱╭╮
--┃╭━╮┃╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱┃┃╰╯┃┃╱╱╱╱┃┃╱╱┃┃╱╱╱╱╱╭╯╰╮
--┃┃╱╰╋━┳━━┳━━┳╮╭┳┳━╮╭━━╮┃╭╮╭╮┣━━┳━╯┣━━┫╰━┳━━┳┻╮╭╯
--┃┃╭━┫╭┫╭╮┃╭╮┃╰╯┣┫╭╮┫╭╮┃┃┃┃┃┃┃╭╮┃╭╮┃╭━┫╭╮┃╭╮┃╭┫┃
--┃╰┻━┃┃┃╰╯┃╰╯┣╮╭┫┃┃┃┃╰╯┃┃┃┃┃┃┃╰╯┃╰╯┃╰━┫┃┃┃╭╮┃┃┃╰╮
--╰━━━┻╯╰━━┻━━╯╰╯╰┻╯╰┻━╮┃╰╯╰╯╰┻━━┻━━┻━━┻╯╰┻╯╰┻╯╰━╯
--╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╭━╯┃
--╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╰━━╯ ///  Dani caga Mandarina :P

-- a modcharting tool for Friday Night Funkin
-- Engines working :
-- modchart tool / framework by: Leo_BPM
-- inspiration from TheZoroForce240 <3
-- modding tool bassed in NotitG

--Specifications:
local nameTool = 'Grooving Modchart Framework'
local Version = ' v2.4.3'

--// Engine Especifications
local engine = 'Psych Engine'

--//list of compatible Engines
--Psych Engine
--P-Slice // works but note positioning is bugged :,(

--Main Switchers
local StrumLineFX = true;
local StrumlinePosMods = true;
local StrumEffects = true;
local CameraEffects = true;

--////Effects Switchers////--

--/StrumLine Notes
local Drunk = true;
local AngleIncoming = true; -- not working
local Speed = true;
local Ease = true;
local RandomSPD = true;
local Dizzy = true;
local SawTooth = true;
local Flying = true;
local RandomScroll = true;
local Freeze = true;
local SineTooth = true;
local Bright = true;
--Advanced
local ScaleByDistance = true;
local AlphaByDistance = true;

--/Strums
local Beating = true;
local AngleNotes = true;
local SizeNotes = true;
local Tipsy = true;
local Opacity = true;
local Direction = true;
local Bump = true;
local Shake = true;

--/misc
local sustainDef = false;

--//Cliprect
local typeCliprect = 'Grooving Modchart Framework';
-- Cliprect list
-- NativePE
-- Grooving Modchart Framework
-- noCliprect
-- ForeverEngine

function onCreatePost()
    -------Strumlines-------
    makeLuaSprite('PlStLine1', '', 0, 0) 
    makeLuaSprite('PlStLine2', '', 0, 0)
    makeLuaSprite('PlStLine3', '', 0, 0)
    makeLuaSprite('PlStLine4', '', 0, 0)

    makeLuaSprite('OpStLine1', '', 0, 0)
    makeLuaSprite('OpStLine2', '', 0, 0)
    makeLuaSprite('OpStLine3', '', 0, 0)
    makeLuaSprite('OpStLine4', '', 0, 0)

    makeLuaSprite('PlStLines', '', 0, 0)
    makeLuaSprite('OpStLines', '', 0, 0)

    -------new strums-------
    makeLuaSprite('PlStrum', '', 0, 0)
    makeLuaSprite('OpStrum', '', 0, 0)

    -----current Notes-----
    makeLuaSprite('OPnote1', '', 0, 0)
    makeLuaSprite('OPnote2', '', 0, 0)
    makeLuaSprite('OPnote3', '', 0, 0)
    makeLuaSprite('OPnote4', '', 0, 0)

    makeLuaSprite('PLnote1', '', 0, 0)
    makeLuaSprite('PLnote2', '', 0, 0)
    makeLuaSprite('PLnote3', '', 0, 0)
    makeLuaSprite('PLnote4', '', 0, 0)

    --Z note tween
    makeLuaSprite('OnotZ1', '', 0, 0)
    makeLuaSprite('OnotZ2', '', 0, 0)
    makeLuaSprite('OnotZ3', '', 0, 0)
    makeLuaSprite('OnotZ4', '', 0, 0)

    makeLuaSprite('PnotZ1', '', 0, 0)
    makeLuaSprite('PnotZ2', '', 0, 0)
    makeLuaSprite('PnotZ3', '', 0, 0)
    makeLuaSprite('PnotZ4', '', 0, 0)

    --Z for strums
    makeLuaSprite('PlStrumZ', '', 0, 0)
    makeLuaSprite('OpStrumZ', '', 0, 0)
    
    ----------------------------------------------
    --               Note Effects               --
    ----------------------------------------------

    --//Position Mods
    makeLuaSprite('Drunk', '', 0, 0) -- work X and Y
    makeLuaSprite('DrunkRate', '', 1, 1) -- work X and Y
    makeLuaSprite('SPDDrunk', '', 1, 1) -- work X and Y

    makeLuaSprite('Invert', '', 1, 1) -- Y

    makeLuaSprite('Flying', '', 0, 0)
    makeLuaSprite('SpawnFly', '', 150, 150)

    makeLuaSprite('SawTooth', '', 0, 0) -- work X and Y
    makeLuaSprite('SawToothRate', '', 1, 1) -- work X and Y

    makeLuaSprite('SineTooth', '', 0, 0) -- work X and Y
    makeLuaSprite('SineToothRate', '', 0, 0) -- work X and Y

    --//Speed Mods
    makeLuaSprite('Ease', '', 1, 1) -- work X, Y and Angle
    makeLuaSprite('SpeedMulti', '', 1, 1) -- work Y

    makeLuaSprite('RandomSPD', '', 1, 1) -- work X (max) and Y (min)

    --//Color Mods
    makeLuaSprite('inBright', '', 0, 0)      -- X: start of FlashTime, Y: end of FlashTime
    makeLuaSprite('outBright', '', 0, 0)      -- X: start of ReturnTime, Y: end of ReturnTime
    makeLuaSprite('BrightInt', '', 255, 0)

    makeLuaSprite('NoteBright', 0, 0)

    --//Opacity mods
    makeLuaSprite('inAlpha', '', 0, 0)        -- X: startAlphaTime, Y: endAlphaTime
    makeLuaSprite('outAlpha', '', 0, 0)       -- X: startReturnTime, Y: endReturnTime
    makeLuaSprite('AlphaNoteTarget', '', 1, 0)      -- X: normalAlpha (not used), Y: targetMultiplier

    --//Scale Mods
    makeLuaSprite('inScale', '', 0, 0)       -- X: start of ScaleTime, Y: end of ScaleTime
    makeLuaSprite('outScale', '', 0, 0)       -- X: start of ReturnTime, Y: end of ReturnTime
    makeLuaSprite('ScaleNoteMult', '', 1, 1)        -- X: scaleMultiplierX, Y: scaleMultiplierY

    --//Angle Mods
    makeLuaSprite('Dizzy', '', 0, 0) -- work angle

    ---------------------------
    --     Strum Effects     --
    ---------------------------
    makeLuaSprite('Expand', '', 1, 1) -- work X,
    makeLuaSprite('Swap', '', 1, 1) -- work X
    makeLuaSprite('AngleStrum', '', 0, 0) -- work angle (duuuuhhh)
    makeLuaSprite('Bulge', '', 1, 1) -- work Y
    makeLuaSprite('Scale', '', 1, 1) -- work X and Y

    makeLuaSprite('Tipsy', '', 0, 0) -- work X and Y
    makeLuaSprite('SPDTipsy', '', 0.1, 0.1) -- work X and Y
    makeLuaSprite('TipRemaping', '', 1, 1) -- work X and Y

    makeLuaSprite('Cross', '', 0, 0) -- work X
    makeLuaSprite('Radius', '', 0, 0) -- work X

    makeLuaSprite('Beating', '', 0, 0) -- work everything
    makeLuaSprite('TypeBeat', '', 0, 0) -- work X

    makeLuaSprite('Bump', '', 0, 0) -- work everything

    makeLuaSprite('Shake', '', 0, 0) -- work everything

    makeLuaSprite('Spin', '', 0, 0) -- work X, Y, angle
    
    --cameraZ
    makeLuaSprite('Deepness', '', 0, 0) -- work X and Y -- Z pos

    ---------------------------
    --      camera mods      --
    ---------------------------
    makeLuaSprite('camDrunk', '', 0, 0)
    makeLuaSprite('camBeat', '', 0, 0)
    makeLuaSprite('camJump', '', 0, 0)
    makeLuaSprite('camZoom', '', 1, 0)
    makeLuaSprite('camSwim', '', 0, 0)
    makeLuaSprite('ZoomBeat', '', 0, 0)

    ----------------------------------------------------------------------------
    --cameras for notes? xd (i didn't think in a better name for this shit xd)
    --'x, y, angle' for 'CAMERA ANGLE' (it isnt a camera but it does a rotation in 360 in X Y Z :v)
    makeLuaSprite('AngCamP1', '', 0, 0) 
    makeLuaSprite('AngCamP2', '', 0, 0)
    makeLuaSprite('AngCamP3', '', 0, 0)
    makeLuaSprite('AngCamP4', '', 0, 0)
    makeLuaSprite('AngCamP', '', 0, 0)

    makeLuaSprite('AngCamO1', '', 0, 0)
    makeLuaSprite('AngCamO2', '', 0, 0)
    makeLuaSprite('AngCamO3', '', 0, 0)
    makeLuaSprite('AngCamO4', '', 0, 0)
    makeLuaSprite('AngCamO', '', 0, 0)
    -------------Pivots----------------
    -- current positions (X, Y) // position Z : angle
    makeLuaSprite('PivotP1', '', 0, 0)
    makeLuaSprite('PivotP2', '', 0, 0)
    makeLuaSprite('PivotP3', '', 0, 0)
    makeLuaSprite('PivotP4', '', 0, 0)
    makeLuaSprite('PivotP', '', 0, 0) -- point between pivotP1 and pivotP4 / for general strum

    makeLuaSprite('PivotO1', '', 0, 0)
    makeLuaSprite('PivotO2', '', 0, 0)
    makeLuaSprite('PivotO3', '', 0, 0)
    makeLuaSprite('PivotO4', '', 0, 0)
    makeLuaSprite('PivotO', '', 0, 0) -- point between pivotO1 and pivotO4 / for general strum

    ---------------------------------------
    ---------- Split Modifiers ------------
    ---------------------------------------

    makeLuaSprite('DrunkP', '', 0, 0)
    makeLuaSprite('DrunkO', '', 0, 0)

    makeLuaSprite('ExpandP', '', 0, 0)
    makeLuaSprite('ExpandO', '', 0, 0)

    makeLuaSprite('SwapP', '', 0, 0)
    makeLuaSprite('SwapO', '', 0, 0)

    makeLuaSprite('BulgeP', '', 0, 0)
    makeLuaSprite('BulgeO', '', 0, 0)

    makeLuaSprite('ScaleP', '', 0, 0)
    makeLuaSprite('ScaleO', '', 0, 0)

    makeLuaSprite('InclinationP', '', 0, 0)
    makeLuaSprite('InclinationO', '', 0, 0)

    makeLuaSprite('TipsyP', '', 0, 0)
    makeLuaSprite('TipsyO', '', 0, 0)

    makeLuaSprite('ContraryP', '', 0, 0)
    makeLuaSprite('ContraryO', '', 0, 0)

    makeLuaSprite('CrossP', '', 0, 0)
    makeLuaSprite('CrossO', '', 0, 0)

    makeLuaSprite('RadiusP', '', 0, 0)
    makeLuaSprite('RadiusO', '', 0, 0)

    makeLuaSprite('BumpP', '', 0, 0)
    makeLuaSprite('BumpO', '', 0, 0)

    makeLuaSprite('BeatingP', '', 0, 0)
    makeLuaSprite('BeatingO', '', 0, 0)

    makeLuaSprite('DizzyP', 0, 0)
    makeLuaSprite('DizzyO', 0, 0)

    makeLuaSprite('SawToothP', '', 0, 0)
    makeLuaSprite('SawToothO', '', 0, 0)

    makeLuaSprite('EaseP', '', 0, 0)
    makeLuaSprite('EaseO', '', 0, 0)

    makeLuaSprite('FlyingP', '', 0, 0)
    makeLuaSprite('FlyingO', '', 0, 0)

    makeLuaSprite('ShakeP', '', 0, 0)
    makeLuaSprite('ShakeO', '', 0, 0)

    makeLuaSprite('SpeedMultiP', '', 1, 1) -- work Y
    makeLuaSprite('SpeedMultiO', '', 1, 1) -- work Y

    makeLuaSprite('InvertP', '', 1, 1) -- work Y
    makeLuaSprite('InvertP1', '', 1, 1)
    makeLuaSprite('InvertP2', '', 1, 1)
    makeLuaSprite('InvertP3', '', 1, 1)
    makeLuaSprite('InvertP4', '', 1, 1)
    
    makeLuaSprite('InvertO', '', 1, 1) -- work Y
    makeLuaSprite('InvertO1', '', 1, 1)
    makeLuaSprite('InvertO2', '', 1, 1)
    makeLuaSprite('InvertO3', '', 1, 1)
    makeLuaSprite('InvertO4', '', 1, 1)

    makeLuaSprite('inBrightP', '', 0, 0)
    makeLuaSprite('outBrightP', '', 0, 0)
    makeLuaSprite('BrightIntP', '', 0, 0)
    
    makeLuaSprite('inBrightO', '', 0, 0)
    makeLuaSprite('outBrightO', '', 0, 0)
    makeLuaSprite('BrightIntO', '', 0, 0)

    makeLuaSprite('inScaleP', '', 0, 0)
    makeLuaSprite('outScaleP', '', 0, 0)
    makeLuaSprite('ScaleNoteMultP', '', 10, 10)

    makeLuaSprite('SineToothP', '', 0, 0)
    makeLuaSprite('SineToothO', '', 0, 0)
    
    makeLuaSprite('FreezeP', '', 0, 0)
    makeLuaSprite('FreezeO', '', 0, 0)

    makeLuaSprite('inScaleO', '', 0, 0)
    makeLuaSprite('outScaleO', '', 0, 0)
    makeLuaSprite('ScaleNoteMultO', '', 10, 10)

    makeLuaSprite('inAlphaP', '', 0, 0)
    makeLuaSprite('outAlphaP', '', 0, 0)
    makeLuaSprite('AlphaNoteTargetP', '', 1, 1)

    makeLuaSprite('inAlphaO', '', 0, 0)
    makeLuaSprite('outAlphaO', '', 0, 0)
    makeLuaSprite('AlphaNoteTargetO', '', 1, 1)
    
    makeLuaSprite('SpinP', '', 0, 0) -- work X, Y, angle
    makeLuaSprite('SpinO', '', 0, 0) -- work X, Y, angle

    makeLuaSprite('NoteBrightP', 0, 0)
    makeLuaSprite('NoteBrightO', 0, 0)

    Aux()
end

function Aux()
    --------------
    -- RECEPTORS--  // internal shit :v
    --------------

    --to make size
    makeLuaSprite('OnotScale1', '', 0, 0)
    makeLuaSprite('OnotScale2', '', 0, 0)
    makeLuaSprite('OnotScale3', '', 0, 0)
    makeLuaSprite('OnotScale4', '', 0, 0)

    makeLuaSprite('PnotScale1', '', 0, 0)
    makeLuaSprite('PnotScale2', '', 0, 0)
    makeLuaSprite('PnotScale3', '', 0, 0)
    makeLuaSprite('PnotScale4', '', 0, 0)

    --for Tipsy
    makeLuaSprite('tipOnot1', '', 0, 0)
    makeLuaSprite('tipOnot2', '', 0, 0)
    makeLuaSprite('tipOnot3', '', 0, 0)
    makeLuaSprite('tipOnot4', '', 0, 0)

    makeLuaSprite('tipPnot1', '', 0, 0)
    makeLuaSprite('tipPnot2', '', 0, 0)
    makeLuaSprite('tipPnot3', '', 0, 0)
    makeLuaSprite('tipPnot4', '', 0, 0)

    --in Z
    makeLuaSprite('TipOnotZ1', '', 0, 0)
    makeLuaSprite('TipOnotZ2', '', 0, 0)
    makeLuaSprite('TipOnotZ3', '', 0, 0)
    makeLuaSprite('TipOnotZ4', '', 0, 0)

    makeLuaSprite('TipPnotZ1', '', 0, 0)
    makeLuaSprite('TipPnotZ2', '', 0, 0)
    makeLuaSprite('TipPnotZ3', '', 0, 0)
    makeLuaSprite('TipPnotZ4', '', 0, 0)

    --Note Direction
    makeLuaSprite('dirO1', '', 1, 1)
    makeLuaSprite('dirO2', '', 1, 1)
    makeLuaSprite('dirO3', '', 1, 1)
    makeLuaSprite('dirO4', '', 1, 1)

    makeLuaSprite('dirP1', '', 1, 1)
    makeLuaSprite('dirP2', '', 1, 1)
    makeLuaSprite('dirP3', '', 1, 1)
    makeLuaSprite('dirP4', '', 1, 1)

    makeLuaSprite('dirO', '', 1, 1)
    makeLuaSprite('dirP', '', 1, 1)

    --beating
    makeLuaSprite('ReceptorBeat', '', 0, 0)
    makeLuaSprite('RecBtP', '', 0, 0)
    makeLuaSprite('RecBtO', '', 0, 0)

    --Z gen pos
    makeLuaSprite('StrumZ1', '', 100, 0)
    makeLuaSprite('StrumZ2', '', 100, 0)

    --bumping
    makeLuaSprite('Pbump1', '', 0, 0)
    makeLuaSprite('Pbump2', '', 0, 0)
    makeLuaSprite('Pbump3', '', 0, 0)
    makeLuaSprite('Pbump4', '', 0, 0)

    makeLuaSprite('Obump1', '', 0, 0)
    makeLuaSprite('Obump2', '', 0, 0)
    makeLuaSprite('Obump3', '', 0, 0)
    makeLuaSprite('Obump4', '', 0, 0)

    --bumping
    makeLuaSprite('Pshake1', '', 0, 0)
    makeLuaSprite('Pshake2', '', 0, 0)
    makeLuaSprite('Pshake3', '', 0, 0)
    makeLuaSprite('Pshake4', '', 0, 0)

    makeLuaSprite('Oshake1', '', 0, 0)
    makeLuaSprite('Oshake2', '', 0, 0)
    makeLuaSprite('Oshake3', '', 0, 0)
    makeLuaSprite('Oshake4', '', 0, 0)

    makeLuaSprite('zBump', '', 0, 0) -- x

    makeLuaSprite('zPbump1', '', 0, 0)
    makeLuaSprite('zPbump2', '', 0, 0)
    makeLuaSprite('zPbump3', '', 0, 0)
    makeLuaSprite('zPbump4', '', 0, 0)

    makeLuaSprite('zObump1', '', 0, 0)
    makeLuaSprite('zObump2', '', 0, 0)
    makeLuaSprite('zObump3', '', 0, 0)
    makeLuaSprite('zObump4', '', 0, 0)

    -- * MISC
    
    --fixer Pixelnote--
    makeLuaSprite('IsPixelNote', '', 0, 0)
    --sustain alpha
    makeLuaSprite('SustainAlpha', '', 100, 0)
    
    --current position Strums
    makeLuaSprite('Strum1', '', 320, 258)
    makeLuaSprite('Strum2', '', -320, 258)

    --helpers :v
    makeLuaSprite('InvCross', '', 0, 1) -- work only in Y
    makeLuaSprite('lockAngP', '', 1, 0)
    makeLuaSprite('lockAngO', '', 1, 0)
    makeLuaSprite('fZ', '', 1, 0)
    makeLuaSprite('DirOnSpinP', '', 0, 0)
    makeLuaSprite('DirOnSpinO', '', 0, 0)
    makeLuaSprite('AngOnSpinP', '', 0, 0)
    makeLuaSprite('AngOnSpinO', '', 0, 0)

    --camera mods receptors
    makeLuaSprite('camDrunkF', '', 0, 0)
    makeLuaSprite('camDrunkSPD', '', 0, 0)
    makeLuaSprite('JumpFact', '', 0, 0)
    makeLuaSprite('cBeatFact', '', 0, 0)
    makeLuaSprite('cMultiAng', '', 0, 0)
    makeLuaSprite('cSwimFact', '', 0, 0)
    makeLuaSprite('camSwimSPD', '', 0, 0)
    makeLuaSprite('cZoombeatFact', '', 0, 0)

    --shitty
    makeLuaText('text', nameTool.. Version..' | leo_BPM', 500, -805)
    setTextAlignment('text', 'right')
    setTextSize('text', 15)
    addLuaText('text')
    setObjectCamera('text', 'Other')
    doTweenX('kchuda', 'text', 750, 0.001, 'sineInOut')
    doTweenY('kchudo', 'text', 685, 0.001, 'sineInOut')
    doTweenAlpha('kchude', 'text', 0.05,0.05)

    --fix noteSize for pixel
    if getPropertyFromClass("PlayState", "isPixelStage") then
        setProperty('IsPixelNote.x', 5.5)
        return
    end

    ModUnspawnNotes()
end

local inDown = 1

-- configuration for custom note skins // modifica las propiedades dependiendo de la skin que tengas
local BscaleY = 1
--end sustain sprite
local BsustainPosY = 40
local BsustainPosX = 8.5
--hold sustain sprite
local BsustPosX = 8.5

--general sustain
local YFixD = -46

-- vvv don't touch this vvv

--<░█████╗░░█████╗░██████╗░███████╗>
--<██╔══██╗██╔══██╗██╔══██╗██╔════╝>
--<██║░░╚═╝██║░░██║██║░░██║█████╗░░>
--<██║░░██╗██║░░██║██║░░██║██╔══╝░░>
--<╚█████╔╝╚█████╔╝██████╔╝███████╗>
--<░╚════╝░░╚════╝░╚═════╝░╚══════╝>
local instaT = 1e-73;

local lastScales = {}

function getAngle(x1, y1, x2, y2)
    local dx = x2 - x1
    local dy = y2 - y1
    return math.deg(math.atan2(dy, dx))
end

function getDistance(x1, y1, x2, y2)
    local dx = x2 - x1
    local dy = y2 - y1
    return math.sqrt(dx * dx + dy * dy)
end

function ModUnspawnNotes()
    if RandomSPD then
        noteSpeedMult = {}

        for i = 0, getProperty('unspawnNotes.length')-1 do
            if not getPropertyFromGroup('unspawnNotes', i, 'isSustainNote') then
                local randomSpeed = math.random(getProperty('RandomSPD.y')*100, getProperty('RandomSPD.x')*100)/100
                
                local strumTime = getPropertyFromGroup('unspawnNotes', i, 'strumTime')
                local noteData = getPropertyFromGroup('unspawnNotes', i, 'noteData')
                local mustPress = getPropertyFromGroup('unspawnNotes', i, 'mustPress')
                
                local key = strumTime .. '_' .. noteData .. '_' .. tostring(mustPress)
                noteSpeedMult[key] = randomSpeed
            end
        end

        for i = 0, getProperty('unspawnNotes.length')-1 do
            if getPropertyFromGroup('unspawnNotes', i, 'isSustainNote') then
                local strumTime = getPropertyFromGroup('unspawnNotes', i, 'strumTime')
                local noteData = getPropertyFromGroup('unspawnNotes', i, 'noteData')
                local mustPress = getPropertyFromGroup('unspawnNotes', i, 'mustPress')

                local key = strumTime .. '_' .. noteData .. '_' .. tostring(mustPress)

                if not noteSpeedMult[key] then
                    noteSpeedMult[key] = noteSpeedMult[key] or 1
                end
            end
        end
    end

    LayeringStrums()
end

local oldUpdatePost = onUpdatePost

function onUpdatePost(elapsed)

    if oldUpdatePost then oldUpdatePost(elapsed) end

    runHaxeCode([[
        var sortFunc = game.variables.get('sortNotesFunc');
        if (sortFunc != null) sortFunc();
    ]]);

    if typeCliprect == 'NativePE' then
    elseif typeCliprect == 'Grooving Modchart Framework' then
        songPos = getSongPosition()
        maxDist = 0.5
        maxDistCalc = maxDist * 10

        for i = 0, getProperty('notes.length') - 1 do
            setPropertyFromGroup('notes', i, 'clipRect', nil)
            
            if getPropertyFromGroup('notes', i, 'isSustainNote') then
                dist = getPropertyFromGroup('notes', i, 'strumTime') - songPos

                if dist < 0 then
                    setPropertyFromGroup('notes', i, 'scale.y', 0)
                elseif dist > 0 then

                    nwClipRect = math.min(dist / maxDistCalc, 1)
                    if nwClipRect < 0 then
                        nwClipRect = 0 
                    end

                    local curScale = getPropertyFromGroup('notes', i, 'scale.y')
                    setPropertyFromGroup('notes', i, 'scale.y', curScale * nwClipRect)

                    local animName = string.lower(getPropertyFromGroup('notes', i, 'animation.curAnim.name') or '')
                    if string.find(animName, 'end') then
                        local multSpeed = getPropertyFromGroup('notes', i, 'multSpeed')
                        local scY = getPropertyFromGroup('notes', i, 'scale.y')

                        setPropertyFromGroup('notes', i, 'scale.y', (BscaleY + (multSpeed - 1)) * nwClipRect)
                        setPropertyFromGroup('notes', i, 'offset.y', (BsustainPosY * dirVal) - ((multSpeed*30) * dirVal))
                    end
                end
            end
        end
    elseif typeCliprect == 'noCliprect' then
        for i = 0, getProperty('notes.length') - 1 do
            setPropertyFromGroup('notes', i, 'clipRect', nil)
        end
    elseif typeCliprect == 'Forever Engine' then
    end

    if not downscroll then
        inDown = 1
    end

    if downscroll then
        inDown = -1
    end
    
    --Player StrumLines

    XstrumL1P = getProperty('PlStLines.x') + getProperty('PlStLine1.x')
    XstrumL2P = getProperty('PlStLines.x') + getProperty('PlStLine2.x')
    XstrumL3P = getProperty('PlStLines.x') + getProperty('PlStLine3.x')
    XstrumL4P = getProperty('PlStLines.x') + getProperty('PlStLine4.x')

    YstrumL1P = getProperty('PlStLines.y') + getProperty('PlStLine1.y')
    YstrumL2P = getProperty('PlStLines.y') + getProperty('PlStLine2.y')
    YstrumL3P = getProperty('PlStLines.y') + getProperty('PlStLine3.y')
    YstrumL4P = getProperty('PlStLines.y') + getProperty('PlStLine4.y')

    ZstrumL1P = getProperty('PlStLines.angle') + getProperty('PlStLine1.angle')
    ZstrumL2P = getProperty('PlStLines.angle') + getProperty('PlStLine2.angle')
    ZstrumL3P = getProperty('PlStLines.angle') + getProperty('PlStLine3.angle')
    ZstrumL4P = getProperty('PlStLines.angle') + getProperty('PlStLine4.angle')

    --Opponent StrumLines

    XstrumL1O = getProperty('OpStLines.x') + getProperty('OpStLine1.x')
    XstrumL2O = getProperty('OpStLines.x') + getProperty('OpStLine2.x')
    XstrumL3O = getProperty('OpStLines.x') + getProperty('OpStLine3.x')
    XstrumL4O = getProperty('OpStLines.x') + getProperty('OpStLine4.x')

    YstrumL1O = getProperty('OpStLines.y') + getProperty('OpStLine1.y')
    YstrumL2O = getProperty('OpStLines.y') + getProperty('OpStLine2.y')
    YstrumL3O = getProperty('OpStLines.y') + getProperty('OpStLine3.y')
    YstrumL4O = getProperty('OpStLines.y') + getProperty('OpStLine4.y')

    ZstrumL1O = getProperty('OpStLines.angle') + getProperty('OpStLine1.angle')
    ZstrumL2O = getProperty('OpStLines.angle') + getProperty('OpStLine2.angle')
    ZstrumL3O = getProperty('OpStLines.angle') + getProperty('OpStLine3.angle')
    ZstrumL4O = getProperty('OpStLines.angle') + getProperty('OpStLine4.angle')

    local dvZ = 100
    
    zValues = {
        player = {Zpl1 / dvZ, Zpl2 / dvZ, Zpl3 / dvZ, Zpl4 / dvZ},
        opponent = {Zop1 / dvZ, Zop2 / dvZ, Zop3 / dvZ, Zop4 / dvZ}
    }
    
    local function getZMod(mustPress, noteData)
        return (mustPress and zValues.player or zValues.opponent)[noteData + 1]
    end

    local noteOffsetX = {}
    local noteOffsetY = {}
    local noteAngle = {}
    
    local noteCache = {}

    local songPos = getSongPosition()
    local notesLength = getProperty('notes.length')

    for i = 0, notesLength - 1 do
        noteOffsetX[i] = 0
        noteOffsetY[i] = 0
        noteAngle[i] = 0
        
        noteCache[i] = {
            strumTime = getPropertyFromGroup('notes', i, 'strumTime'),
            noteData = getPropertyFromGroup('notes', i, 'noteData'),
            mustPress = getPropertyFromGroup('notes', i, 'mustPress'),
            isSustain = getPropertyFromGroup('notes', i, 'isSustainNote'),
            distance = nil,
            zMod = nil
        }
        
        noteCache[i].distance = noteCache[i].strumTime - songPos
        noteCache[i].zMod = getZMod(noteCache[i].mustPress, noteCache[i].noteData)
    end

    if StrumLineFX == true then

        if Drunk then
            local DrunkSpeedX = getProperty('SPDDrunk.x') / 5
            local DrunkSpeedY = getProperty('SPDDrunk.y') / 5
            local DrunkSpeedZ = getProperty('SPDDrunk.angle')
            local DrunkRateX = getProperty('DrunkRate.x')
            local DrunkRateY = getProperty('DrunkRate.y')
            local DrunkRateZ = getProperty('DrunkRate.angle')
            local DrunkIntX = getProperty('Drunk.x') * 5
            local DrunkIntY = getProperty('Drunk.y') * 5
            local DrunkIntZ = getProperty('Drunk.angle')
            local DrunkPX = getProperty('DrunkP.x')
            local DrunkPY = getProperty('DrunkP.y')
            local DrunkPZ = getProperty('DrunkP.angle')
            local DrunkOX = getProperty('DrunkO.x')
            local DrunkOY = getProperty('DrunkO.y')
            local DrunkOZ = getProperty('DrunkO.angle')

            for i = 0, notesLength - 1 do
                local cache = noteCache[i]
                
                local OscDistanceX = cache.strumTime - songPos / DrunkSpeedX
                local OscDistanceY = cache.strumTime - songPos / DrunkSpeedY
                local OscDistanceZ = cache.strumTime - songPos / DrunkSpeedZ

                local endCenter = math.max(0, math.min(cache.distance / 200, 1))
                
                local sinX = math.sin(OscDistanceX / DrunkRateX)
                local sinY = math.sin(OscDistanceY / DrunkRateY)
                local sinZ = math.sin(OscDistanceZ / DrunkRateZ)
        
                local drunkMod = cache.mustPress and {DrunkPX, DrunkPY, DrunkPZ} or {DrunkOX, DrunkOY, DrunkOZ}

                local DrunkerX = sinX * (DrunkIntX + drunkMod[1]) * endCenter
                local DrunkerY = sinY * (DrunkIntY + drunkMod[2]) * endCenter
                local DrunkerZ = sinZ * (DrunkIntZ + drunkMod[3]) * endCenter
                
                noteOffsetX[i] = noteOffsetX[i] + (DrunkerX * cache.zMod)
                noteOffsetY[i] = noteOffsetY[i] + (DrunkerY * cache.zMod)
            end
        end

        if Speed then

            divSpeedZ = 100

            SpdMult   = getProperty('SpeedMulti.y')
            spdMultP = getProperty('SpeedMultiP.y')
            spdMultO = getProperty('SpeedMultiO.y')

            InvPlayer   = getProperty('InvertP.y') * getProperty('Invert.y')
            InvOpponent = getProperty('InvertO.y') * getProperty('Invert.y')

            InvertP1 = getProperty('InvertP1.y')
            InvertP2 = getProperty('InvertP2.y')
            InvertP3 = getProperty('InvertP3.y')
            InvertP4 = getProperty('InvertP4.y')

            InvertO1 = getProperty('InvertO1.y')
            InvertO2 = getProperty('InvertO2.y')
            InvertO3 = getProperty('InvertO3.y')
            InvertO4 = getProperty('InvertO4.y')

            InvertP = { InvertP1, InvertP2, InvertP3, InvertP4 }
            InvertO = { InvertO1, InvertO2, InvertO3, InvertO4 }

            pZ = { pNot1Z, pNot2Z, pNot3Z, pNot4Z }
            oZ = { oNot1Z, oNot2Z, oNot3Z, oNot4Z }

            for i = 0, getProperty('notes.length') - 1 do

                PlayerStrum = noteCache[i].mustPress
                noteData = noteCache[i].noteData + 1

                strumTime = noteCache[i].strumTime
                key = strumTime .. '_' .. (noteData - 1) .. '_' .. tostring(PlayerStrum)
                randomMult = noteSpeedMult[key] or 1

                curSpeed = getPropertyFromGroup('notes', i, 'multSpeed')
                curY = getPropertyFromGroup('notes', i, 'y')
                Sust = getPropertyFromGroup('notes', i, 'isSustainNote')
                fixSusPos = curY + (YFixD * curSpeed)

                if PlayerStrum then
                    InvSide = InvPlayer
                    spdSide = spdMultP
                    Invert = InvertP
                    zVal = pZ
                    strumGrp = 'playerStrums'
                else
                    InvSide = InvOpponent
                    spdSide = spdMultO
                    Invert = InvertO
                    zVal = oZ
                    strumGrp = 'opponentStrums'
                end

                dirVal = SpdMult * Invert[noteData] * InvSide

                setPropertyFromGroup(
                    'notes', i, 'multSpeed',
                    (((SpdMult * spdSide) * ((zVal[noteData] + divSpeedZ) / divSpeedZ))
                    * ((Invert[noteData] * Invert[noteData]) * (InvSide * InvSide))
                    * inDown) * randomMult
                )

                if dirVal < 0 then
                    setPropertyFromGroup(strumGrp, noteData - 1, 'downScroll', true)
                    if Sust then
                        setPropertyFromGroup('notes', i, 'y', fixSusPos)
                    end
                elseif dirVal > 0 then
                    setPropertyFromGroup(strumGrp, noteData - 1, 'downScroll', false)
                end
            end
        end

        if Freeze then
        end

        if Opacity then
            local divSus = getProperty('SustainAlpha.x') / 100

            for i = 0, notesLength - 1 do
                local cache = noteCache[i]
                local fade = cache.mustPress and PlFade or OpFade

                if cache.isSustain then
                    fade = fade / divSus
                end

                setPropertyFromGroup('notes', i, 'alpha', fade)
            end
        end
    
        if Ease then
            INmaxDistance = getProperty('Ease.angle') * 100
            INmaxSpeed = getProperty('Ease.x')
            INminSpeed = getProperty('Ease.y')
        
            for i = 0, notesLength - 1 do
                local cache = noteCache[i]
                local INspeed = INmaxSpeed - (INmaxSpeed - INminSpeed) * math.min(cache.distance / INmaxDistance, 1)
                setPropertyFromGroup('notes', i, 'multSpeed', getPropertyFromGroup('notes', i, 'multSpeed') * INspeed)
            end
        end
    
        if Flying then
            local spawnFlyX = getProperty('SpawnFly.x')
            local flyingX = getProperty('Flying.x')

            local spawnFlyY = getProperty('SpawnFly.y')
            local flyingY = getProperty('Flying.y')

            for i = 0, notesLength - 1 do
                local cache = noteCache[i]

                if cache.distance ~= 0 then
                    local offsetX = (math.abs(cache.distance) / spawnFlyX) ^ flyingX
                    local offsetY = (math.abs(cache.distance) / spawnFlyY) ^ flyingY

                    if math.cos(cache.strumTime * 0.03) > 0 then
                        noteOffsetX[i] = noteOffsetX[i] + (offsetX * cache.zMod)
                        noteOffsetY[i] = noteOffsetY[i] + (offsetY * cache.zMod)
                    else
                        noteOffsetX[i] = noteOffsetX[i] - (offsetX * cache.zMod)
                        noteOffsetY[i] = noteOffsetY[i] - (offsetY * cache.zMod)
                    end
                end
            end
        end

        if getProperty('Flying.x') == 0 then
            Flying = false
        elseif getProperty('Flying.x') ~= 0 then
            Flying = true
        end
    
        if Dizzy then
            for i = 0, notesLength - 1 do
                local cache = noteCache[i]
                local dist = cache.distance

                local OdizAng = (getProperty('Dizzy.angle') + getProperty('DizzyO.angle')) * (dist / 200)
                local PdizAng = (getProperty('Dizzy.angle') + getProperty('DizzyP.angle')) * (dist / 200)

                noteAngle[i] = noteAngle[i] + (cache.mustPress and PdizAng or OdizAng)
            end
        end
    
        if AngleNotes then
            for i = 0, notesLength - 1 do 
                local cache = noteCache[i]
                                
                if not cache.isSustain then
                    if cache.mustPress then
                        if cache.noteData == 0 then
                            setPropertyFromGroup('notes', i, 'angle', noteAngle[i] + angPlNote1)
                        elseif cache.noteData == 1 then
                            setPropertyFromGroup('notes', i, 'angle', noteAngle[i] + angPlNote2)
                        elseif cache.noteData == 2 then
                            setPropertyFromGroup('notes', i, 'angle', noteAngle[i] + angPlNote3)
                        elseif cache.noteData == 3 then
                            setPropertyFromGroup('notes', i, 'angle', noteAngle[i] + angPlNote4)
                        end
                    else
                        if cache.noteData == 0 then
                            setPropertyFromGroup('notes', i, 'angle', noteAngle[i] + angOpNote1)
                        elseif cache.noteData == 1 then
                            setPropertyFromGroup('notes', i, 'angle', noteAngle[i] + angOpNote2)
                        elseif cache.noteData == 2 then
                            setPropertyFromGroup('notes', i, 'angle', noteAngle[i] + angOpNote3)
                        elseif cache.noteData == 3 then
                            setPropertyFromGroup('notes', i, 'angle', noteAngle[i] + angOpNote4)
                        end
                    end 
                end
            end
        end

        if SawTooth then
            local xIntSTP = getProperty('SawTooth.x') + getProperty('SawToothP.x')
            local xIntSTO = getProperty('SawTooth.x') + getProperty('SawToothO.x')

            local yIntSTP = getProperty('SawTooth.y') + getProperty('SawToothP.y')
            local yIntSTO = getProperty('SawTooth.y') + getProperty('SawToothO.y')

            local sawtoothSpeedX = getProperty('SawToothRate.x') + 60
            local sawtoothSpeedY = getProperty('SawToothRate.y') + 60

            for i = 0, notesLength - 1 do
                local cache = noteCache[i]
                local progress = (songPos - cache.strumTime) / 1000

                local XsawtoothValue = (progress * sawtoothSpeedX/10) % 1
                local YsawtoothValue = (progress * sawtoothSpeedY/10) % 1

                local offsetXp = XsawtoothValue * (xIntSTP*3)
                local offsetXo = XsawtoothValue * (xIntSTO*3)

                local offsetYp = YsawtoothValue * (yIntSTP*3)
                local offsetYo = YsawtoothValue * (yIntSTO*3)

                local xFormSTP = offsetXp - (xIntSTP*3)
                local xFormSTO = offsetXo - (xIntSTO*3)

                local yFormSTP = offsetYp - (yIntSTP*3)
                local yFormSTO = offsetYo - (yIntSTO*3)

                if cache.mustPress then
                    noteOffsetX[i] = noteOffsetX[i] + (xFormSTP * cache.zMod)
                    noteOffsetY[i] = noteOffsetY[i] + (yFormSTP * cache.zMod)
                else
                    noteOffsetX[i] = noteOffsetX[i] + (xFormSTO * cache.zMod)
                    noteOffsetY[i] = noteOffsetY[i] + (yFormSTO * cache.zMod)
                end
            end
        end

        if SineTooth then
            local SineRateX = getProperty('SineToothRate.x')
            local SineRateY = getProperty('SineToothRate.y')
            local SineRateZ = getProperty('SineToothRate.angle')
            local SineIntX = getProperty('SineTooth.x')
            local SineIntY = getProperty('SineTooth.y')
            local SineIntZ = getProperty('SineTooth.angle')
            local SinePX = getProperty('SineToothP.x')
            local SinePY = getProperty('SineToothP.y')
            local SinePZ = getProperty('SineToothP.angle')
            local SineOX = getProperty('SineToothO.x')
            local SineOY = getProperty('SineToothO.y')
            local SineOZ = getProperty('SineToothO.angle')

            for i = 0, notesLength - 1 do
                local cache = noteCache[i]

                local OscDistX = cache.strumTime - songPos
                local OscDistY = cache.strumTime - songPos
                local OscDistZ = cache.strumTime - songPos

                local sinX = math.sin(OscDistX / SineRateX)
                local sinY = math.sin(OscDistY / SineRateY)
                local sinZ = math.sin(OscDistZ / SineRateZ)

                local sineMod = cache.mustPress and {SinePX, SinePY, SinePZ} or {SineOX, SineOY, SineOZ}

                local SineWaveX = sinX * (SineIntX + sineMod[1])
                local SineWaveY = sinY * (SineIntY + sineMod[2])
                local SineWaveZ = sinZ * (SineIntZ + sineMod[3])
                
                noteOffsetX[i] = noteOffsetX[i] + (SineWaveX * cache.zMod)
                noteOffsetY[i] = noteOffsetY[i] + (SineWaveY * cache.zMod)
            end
        end

        if Bright then
            for i = 0, notesLength - 1 do
                local cache = noteCache[i]
                local timeDiff = cache.strumTime - songPos
                
                local startFlashTime = (getProperty('inBright.x') + (cache.mustPress and getProperty('inBrightP.x') or getProperty('inBrightO.x')))*10
                local endFlashTime = (getProperty('inBright.y') + (cache.mustPress and getProperty('inBrightP.y') or getProperty('inBrightO.y')))*10
                local startReturnTime = (getProperty('outBright.x') + (cache.mustPress and getProperty('outBrightP.x') or getProperty('outBrightO.x')))*10
                local endReturnTime = (getProperty('outBright.y') + (cache.mustPress and getProperty('outBrightP.y') or getProperty('outBrightO.y')))*10
                local maxBrightness = getProperty('BrightInt.x') + (cache.mustPress and getProperty('BrightIntP.x') or getProperty('BrightIntO.x'))
                
                if timeDiff > 0 and timeDiff <= startFlashTime then
                    local colorOffset = 0
                    
                    if timeDiff > endFlashTime then
                        local range = startFlashTime - endFlashTime
                        local progress = (startFlashTime - timeDiff) / range
                        colorOffset = progress * maxBrightness
                    elseif timeDiff > startReturnTime then
                        colorOffset = maxBrightness
                    elseif timeDiff > endReturnTime then
                        local range = startReturnTime - endReturnTime
                        local progress = (startReturnTime - timeDiff) / range
                        colorOffset = maxBrightness - (progress * maxBrightness)
                    end
                    
                    setPropertyFromGroup('notes', i, 'colorTransform.redOffset', colorOffset)
                    setPropertyFromGroup('notes', i, 'colorTransform.greenOffset', colorOffset)
                    setPropertyFromGroup('notes', i, 'colorTransform.blueOffset', colorOffset)
                end
            end
        end

        if ScaleByDistance then
            for i = 0, notesLength - 1 do
                local cache = noteCache[i]
                local timeDiff = cache.strumTime - songPos
                
                local startScaleTime = (getProperty('inScale.x') + (cache.mustPress and getProperty('inScaleP.x') or getProperty('inScaleO.x')))*10
                local endScaleTime = (getProperty('inScale.y') + (cache.mustPress and getProperty('inScaleP.y') or getProperty('inScaleO.y')))*10
                local startReturnTime = (getProperty('outScale.x') + (cache.mustPress and getProperty('outScaleP.x') or getProperty('outScaleO.x')))*10
                local endReturnTime = (getProperty('outScale.y') + (cache.mustPress and getProperty('outScaleP.y') or getProperty('outScaleO.y')))*10
                local scaleMultiplierX = getProperty('ScaleNoteMult.x') + ((cache.mustPress and getProperty('ScaleNoteMultP.x') or getProperty('ScaleNoteMultO.x'))/10)
                local scaleMultiplierY = getProperty('ScaleNoteMult.y') + ((cache.mustPress and getProperty('ScaleNoteMultP.y') or getProperty('ScaleNoteMultO.y'))/10)
                
                if timeDiff > 0 and timeDiff <= startScaleTime then
                    local scaleMultiplier = 1.0
                    
                    if timeDiff > endScaleTime then
                        local range = startScaleTime - endScaleTime
                        local progress = (startScaleTime - timeDiff) / range
                        scaleMultiplier = 1.0 + (progress * (scaleMultiplierX - 1.0))
                    elseif timeDiff > startReturnTime then
                        scaleMultiplier = scaleMultiplierX
                    elseif timeDiff > endReturnTime then
                        local range = startReturnTime - endReturnTime
                        local progress = (startReturnTime - timeDiff) / range
                        scaleMultiplier = scaleMultiplierX - (progress * (scaleMultiplierX - 1.0))
                    end
                    
                    local currentScaleX = getPropertyFromGroup('notes', i, 'scale.x')
                    local currentScaleY = getPropertyFromGroup('notes', i, 'scale.y')

                    if not cache.isSustain then
                        setPropertyFromGroup('notes', i, 'scale.x', currentScaleX * scaleMultiplier)
                        setPropertyFromGroup('notes', i, 'scale.y', currentScaleY * scaleMultiplier)
                    else
                        setPropertyFromGroup('notes', i, 'scale.x', currentScaleX * scaleMultiplier)
                    end
                end
            end
        end

        if AlphaByDistance then
            for i = 0, notesLength - 1 do
                local cache = noteCache[i]
                local timeDiff = cache.strumTime - songPos

                local startAlphaTime = (getProperty('inAlpha.x') + (cache.mustPress and getProperty('inAlphaP.x') or getProperty('inAlphaO.x')))*10
                local endAlphaTime = (getProperty('inAlpha.y') + (cache.mustPress and getProperty('inAlphaP.y') or getProperty('inAlphaO.y')))*10
                local startReturnTime = (getProperty('outAlpha.x') + (cache.mustPress and getProperty('outAlphaP.x') or getProperty('outAlphaO.x')))*10
                local endReturnTime = (getProperty('outAlpha.y') + (cache.mustPress and getProperty('outAlphaP.y') or getProperty('outAlphaO.y')))*10
                local targetAlphaMultiplier = getProperty('AlphaNoteTarget.y') * (cache.mustPress and getProperty('AlphaNoteTargetP.y') or getProperty('AlphaNoteTargetO.y'))
                if timeDiff > 0 and timeDiff <= startAlphaTime then
                    local alphaMultiplier = 1.0
                    
                    if timeDiff > endAlphaTime then
                        local range = startAlphaTime - endAlphaTime
                        local progress = (startAlphaTime - timeDiff) / range
                        alphaMultiplier = 1.0 + (progress * (targetAlphaMultiplier - 1.0))
                    elseif timeDiff > startReturnTime then
                        alphaMultiplier = targetAlphaMultiplier
                    elseif timeDiff > endReturnTime then
                        local range = startReturnTime - endReturnTime
                        local progress = (startReturnTime - timeDiff) / range
                        alphaMultiplier = targetAlphaMultiplier + (progress * (1.0 - targetAlphaMultiplier))
                    end
                    
                    local currentAlpha = getPropertyFromGroup('notes', i, 'alpha')
                    setPropertyFromGroup('notes', i, 'alpha', currentAlpha * alphaMultiplier)
                end
            end
        end

        if Direction then
        end

        if StrumlinePosMods == true then

            for i = 0, notesLength - 1 do
                local cache = noteCache[i]
                local noteData = cache.noteData

                if cache.mustPress then
                    if noteData == 0 then
                        noteOffsetX[i] = noteOffsetX[i] + (XstrumL1P * cache.zMod)
                        noteOffsetY[i] = noteOffsetY[i] + (YstrumL1P * cache.zMod)
                    elseif noteData == 1 then
                        noteOffsetX[i] = noteOffsetX[i] + (XstrumL2P * cache.zMod)
                        noteOffsetY[i] = noteOffsetY[i] + (YstrumL2P * cache.zMod)
                    elseif noteData == 2 then
                        noteOffsetX[i] = noteOffsetX[i] + (XstrumL3P * cache.zMod)
                        noteOffsetY[i] = noteOffsetY[i] + (YstrumL3P * cache.zMod)
                    elseif noteData == 3 then
                        noteOffsetX[i] = noteOffsetX[i] + (XstrumL4P * cache.zMod)
                        noteOffsetY[i] = noteOffsetY[i] + (YstrumL4P * cache.zMod)
                    end
                else
                    if noteData == 0 then
                        noteOffsetX[i] = noteOffsetX[i] + (XstrumL1O * cache.zMod)
                        noteOffsetY[i] = noteOffsetY[i] + (YstrumL1O * cache.zMod)
                    elseif noteData == 1 then
                        noteOffsetX[i] = noteOffsetX[i] + (XstrumL2O * cache.zMod)
                        noteOffsetY[i] = noteOffsetY[i] + (YstrumL2O * cache.zMod)
                    elseif noteData == 2 then
                        noteOffsetX[i] = noteOffsetX[i] + (XstrumL3O * cache.zMod)
                        noteOffsetY[i] = noteOffsetY[i] + (YstrumL3O * cache.zMod)
                    elseif noteData == 3 then
                        noteOffsetX[i] = noteOffsetX[i] + (XstrumL4O * cache.zMod)
                        noteOffsetY[i] = noteOffsetY[i] + (YstrumL4O * cache.zMod)
                    end
                end
            end

            for i = 0, getProperty('notes.length') - 1 do
                local currentX = getPropertyFromGroup('notes', i, 'x')
                local currentY = getPropertyFromGroup('notes', i, 'y')

                setPropertyFromGroup('notes', i, 'x', currentX + noteOffsetX[i])
                setPropertyFromGroup('notes', i, 'y', currentY + noteOffsetY[i])
            end

            for i = 0, getProperty('notes.length')-1 do
                if getPropertyFromGroup('notes', i, 'isSustainNote') then
                    local animName = string.lower(getPropertyFromGroup('notes', i, 'animation.curAnim.name') or '')

                    if not string.find(animName, 'end') then
                        local scaleX = getPropertyFromGroup('notes', i, 'scale.x')
                        setPropertyFromGroup('notes', i, 'offset.x', BsustainPosX - scaleX )
                    end
                end
            end
        end

        --------------------------------------------------------------
        ---------------------- Strums layering -----------------------
        --------------------------------------------------------------

        local changed = false

        for i = 0, getProperty('strumLineNotes.length') - 1 do
            local sx = getPropertyFromGroup('strumLineNotes', i, 'scale.x')
            local sy = getPropertyFromGroup('strumLineNotes', i, 'scale.y')
            local area = sx * sy

            if lastScales[i] ~= area then
                lastScales[i] = area
                changed = true
            end
        end

        if not changed then return end

        runHaxeCode([[
            var grp = game.strumLineNotes;
            if (grp == null) return;

            grp.members.sort(function(a, b) {
                if (a == null || b == null) return 0;

                var sa = a.scale.x * a.scale.y;
                var sb = b.scale.x * b.scale.y;

                return sa > sb ? 1 : -1;
            });
        ]])
    end
end

function onUpdate(elapsed)

    songPos = getSongPosition()

    --generalZ use

    divZ = 100

    curPosZp = getProperty('StrumZ1.x')
    curPosZo = getProperty('StrumZ2.x')

    --tipsy
    tipPz1 = getProperty('TipPnotZ1.x')
    tipPz2 = getProperty('TipPnotZ2.x')
    tipPz3 = getProperty('TipPnotZ3.x')
    tipPz4 = getProperty('TipPnotZ4.x')

    tipOz1 = getProperty('TipOnotZ1.x')
    tipOz2 = getProperty('TipOnotZ2.x')
    tipOz3 = getProperty('TipOnotZ3.x')
    tipOz4 = getProperty('TipOnotZ4.x')

    TipZMult = getProperty('Tipsy.angle')/1.5

    --modifiers for z
    RadZ = getProperty('Radius.angle') * 2

    BulgeZ = getProperty('Bulge.angle')/2
    midZ = BulgeZ/3

    pContraryZ = getProperty('Cross.angle') + getProperty('CrossP.angle')
    oContraryZ = getProperty('Cross.angle') + getProperty('CrossO.angle')

    angSpinZp = getProperty('SpinP.x') + getProperty('Spin.x')
    PcalcZ = (math.pi/180) * (angSpinZp)
    ZspinXp = math.cos(PcalcZ)
    ZspinYp = math.sin(PcalcZ)

    angSpinZo = getProperty('SpinO.x') + getProperty('Spin.x')
    OcalcZ = (math.pi/180) * (angSpinZo)
    ZspinXo = math.cos(OcalcZ)
    ZspinYo = math.sin(OcalcZ)

    pInclinationZ = ((getProperty('Expand.angle') + getProperty('ExpandP.angle') + (ZspinYp * 5)) * 2)
    oInclinationZ = ((getProperty('Expand.angle') + getProperty('ExpandO.angle') + (ZspinYo * 5)) * 2)

    pNot1Z = getProperty('PnotZ1.x') + getProperty('PlStrumZ.x') + tipPz1 * (TipZMult + getProperty('TipsyP.angle')) + pInclinationZ - midZ + pContraryZ + RadZ + getProperty('zPbump1.x')
    pNot2Z = getProperty('PnotZ2.x') + getProperty('PlStrumZ.x') + tipPz2 * (TipZMult + getProperty('TipsyP.angle')) + (pInclinationZ/3) - BulgeZ - pContraryZ + RadZ + getProperty('zPbump2.x')
    pNot3Z = getProperty('PnotZ3.x') + getProperty('PlStrumZ.x') + tipPz3 * (TipZMult + getProperty('TipsyP.angle')) - (pInclinationZ/3) - BulgeZ + pContraryZ + RadZ + getProperty('zPbump3.x')
    pNot4Z = getProperty('PnotZ4.x') + getProperty('PlStrumZ.x') + tipPz4 * (TipZMult + getProperty('TipsyP.angle')) - pInclinationZ - midZ - pContraryZ + RadZ + getProperty('zPbump4.x')

    oNot1Z = getProperty('OnotZ1.x') + getProperty('OpStrumZ.x') + tipOz1 * (TipZMult + getProperty('TipsyO.angle')) + oInclinationZ - midZ + pContraryZ + RadZ + getProperty('zObump1.x')
    oNot2Z = getProperty('OnotZ2.x') + getProperty('OpStrumZ.x') + tipOz2 * (TipZMult + getProperty('TipsyO.angle')) + (oInclinationZ/3) - BulgeZ - pContraryZ + RadZ + getProperty('zObump2.x')
    oNot3Z = getProperty('OnotZ3.x') + getProperty('OpStrumZ.x') + tipOz3 * (TipZMult + getProperty('TipsyO.angle')) - (oInclinationZ/3) - BulgeZ + pContraryZ + RadZ + getProperty('zObump3.x')
    oNot4Z = getProperty('OnotZ4.x') + getProperty('OpStrumZ.x') + tipOz4 * (TipZMult + getProperty('TipsyO.angle')) - oInclinationZ - midZ - pContraryZ + RadZ + getProperty('zObump4.x')

    Zop1 = curPosZo + (oNot1Z)
    Zop2 = curPosZo + (oNot2Z)
    Zop3 = curPosZo + (oNot3Z)
    Zop4 = curPosZo + (oNot4Z)

    Zpl1 = curPosZp + (pNot1Z)
    Zpl2 = curPosZp + (pNot2Z)
    Zpl3 = curPosZp + (pNot3Z)
    Zpl4 = curPosZp + (pNot4Z)

    pNoteZ1 = getProperty('ZlineP1.x')
    pNoteZ2 = getProperty('ZlineP2.x')
    pNoteZ3 = getProperty('ZlineP3.x')
    pNoteZ4 = getProperty('ZlineP4.x')

    oNoteZ1 = getProperty('ZlineO1.x')
    oNoteZ2 = getProperty('ZlineO2.x')
    oNoteZ3 = getProperty('ZlineO3.x')
    oNoteZ4 = getProperty('ZlineO4.x')

    --new notes shit

    if StrumEffects == true then
        ------------------------------------------------------------
        --NoteStrums Controllers
        ------------------------------------------------------------

        xOpNote1 = getProperty('OPnote1.x') + getProperty('Obump1.x')
        xOpNote2 = getProperty('OPnote2.x') + getProperty('Obump2.x')
        xOpNote3 = getProperty('OPnote3.x') + getProperty('Obump3.x')
        xOpNote4 = getProperty('OPnote4.x') + getProperty('Obump4.x')

        xPlNote1 = getProperty('PLnote1.x') + getProperty('Pbump1.x')
        xPlNote2 = getProperty('PLnote2.x') + getProperty('Pbump2.x')
        xPlNote3 = getProperty('PLnote3.x') + getProperty('Pbump3.x')
        xPlNote4 = getProperty('PLnote4.x') + getProperty('Pbump4.x')

        yOpNote1 = getProperty('OPnote1.y') + getProperty('Obump1.y')
        yOpNote2 = getProperty('OPnote2.y') + getProperty('Obump2.y')
        yOpNote3 = getProperty('OPnote3.y') + getProperty('Obump3.y')
        yOpNote4 = getProperty('OPnote4.y') + getProperty('Obump4.y')

        yPlNote1 = getProperty('PLnote1.y') + getProperty('Pbump1.y')
        yPlNote2 = getProperty('PLnote2.y') + getProperty('Pbump2.y')
        yPlNote3 = getProperty('PLnote3.y') + getProperty('Pbump3.y')
        yPlNote4 = getProperty('PLnote4.y') + getProperty('Pbump4.y')

        PlStrumY = getProperty('PlStrum.y')
        OpStrumY = getProperty('OpStrum.y')
        PlStrumX = getProperty('PlStrum.x')
        OpStrumX = getProperty('OpStrum.x')

        XnoteOtip1 = getProperty('tipOnot1.x')
        XnoteOtip2 = getProperty('tipOnot2.x')
        XnoteOtip3 = getProperty('tipOnot3.x')
        XnoteOtip4 = getProperty('tipOnot4.x')

        YnoteOtip1 = getProperty('tipOnot1.y')
        YnoteOtip2 = getProperty('tipOnot2.y')
        YnoteOtip3 = getProperty('tipOnot3.y')
        YnoteOtip4 = getProperty('tipOnot4.y')

        XnotePtip1 = getProperty('tipPnot1.x')
        XnotePtip2 = getProperty('tipPnot2.x')
        XnotePtip3 = getProperty('tipPnot3.x')
        XnotePtip4 = getProperty('tipPnot4.x')

        YnotePtip1 = getProperty('tipPnot1.y')
        YnotePtip2 = getProperty('tipPnot2.y')
        YnotePtip3 = getProperty('tipPnot3.y')
        YnotePtip4 = getProperty('tipPnot4.y')

        InvertPFactor = getProperty('Invert.y') * getProperty('InvertP.y')
        InvertOFactor = getProperty('Invert.y') * getProperty('InvertO.y')

        SwapFactor = getProperty('Swap.x')

        --both
        Rad = getProperty('Radius.x') * 5

        angSpinP = getProperty('SpinP.angle') + getProperty('Spin.angle')
        Pcalc = (math.pi/180) * (angSpinP)
        spinXp = math.cos(Pcalc)
        spinYp = math.sin(Pcalc)

        angSpinO = getProperty('SpinO.angle') + getProperty('Spin.angle')
        Ocalc = (math.pi/180) * (angSpinO)
        spinXo = math.cos(Ocalc)
        spinYo = math.sin(Ocalc)

        -- Y
        Bulge = getProperty('Bulge.y') * 2
        mid = Bulge/3

        ContraryP = ((getProperty('Cross.y') + getProperty('CrossP.y')) * getProperty('InvCross.y'))
        ContraryO = ((getProperty('Cross.y') + getProperty('CrossO.y')) * getProperty('InvCross.y'))

        InclinationP = (180 * ((getProperty('Expand.y') + getProperty('ExpandP.y')) * spinYp))
        InclinationO = (180 * ((getProperty('Expand.y') + getProperty('ExpandO.y')) * spinYo))

        Ubic0y = 308

        tipFactY = getProperty('Tipsy.y') * 2

        BeatModY = getProperty('ReceptorBeat.y')
        PBeatModY = getProperty('RecBtP.y')
        OBeatModY = getProperty('RecBtO.y')

        BeatFactY = getProperty('Beating.y') * 10
        PBeatFactY = getProperty('BeatingP.y') * 10
        OBeatFactY = getProperty('BeatingO.y') * 10

        PshakeY1 = getProperty('Pshake1.y')
        PshakeY2 = getProperty('Pshake2.y')
        PshakeY3 = getProperty('Pshake3.y')
        PshakeY4 = getProperty('Pshake4.y')

        OshakeY1 = getProperty('Oshake1.y')
        OshakeY2 = getProperty('Oshake2.y')
        OshakeY3 = getProperty('Oshake3.y')
        OshakeY4 = getProperty('Oshake4.y')

        yPnotMods1 = Ubic0y + yPlNote1 + (PshakeY1 * (getProperty('ShakeP.y') + getProperty('Shake.y'))) + (YnoteOtip1 * (tipFactY + getProperty('TipsyP.y') * 2)) + (InclinationP + getProperty('InclinationP.y')) - mid + ContraryP + (BeatModY * BeatFactY) + (PBeatModY * PBeatFactY) + PlStrumY + getProperty('Strum1.y') * -InvertPFactor * InvertP1 * inDown
        yPnotMods2 = Ubic0y + yPlNote2 + (PshakeY2 * (getProperty('ShakeP.y') + getProperty('Shake.y'))) + (YnoteOtip2 * (tipFactY + getProperty('TipsyP.y') * 2)) + (InclinationP + getProperty('InclinationP.y'))/3 - Bulge - ContraryP + Rad + (BeatModY * BeatFactY) + (PBeatModY * PBeatFactY) + PlStrumY + getProperty('Strum1.y') * -InvertPFactor * InvertP2 * inDown
        yPnotMods3 = Ubic0y + yPlNote3 + (PshakeY3 * (getProperty('ShakeP.y') + getProperty('Shake.y'))) + (YnoteOtip3 * (tipFactY + getProperty('TipsyP.y') * 2)) - (InclinationP + getProperty('InclinationP.y'))/3 - Bulge + ContraryP - Rad + (BeatModY * BeatFactY) + (PBeatModY * PBeatFactY) + PlStrumY + getProperty('Strum1.y') * -InvertPFactor * InvertP3 * inDown
        yPnotMods4 = Ubic0y + yPlNote4 + (PshakeY4 * (getProperty('ShakeP.y') + getProperty('Shake.y'))) + (YnoteOtip4 * (tipFactY + getProperty('TipsyP.y')) * 2) - (InclinationP + getProperty('InclinationP.y')) - mid - ContraryP + (BeatModY * BeatFactY) + (PBeatModY * PBeatFactY) + PlStrumY + getProperty('Strum1.y') * -InvertPFactor * InvertP4 * inDown

        yOnotMods1 = Ubic0y + yOpNote1 + (OshakeY1 * (getProperty('ShakeO.y') + getProperty('Shake.y'))) + (YnotePtip1 * (tipFactY + getProperty('TipsyO.y') * 2)) + (InclinationO + getProperty('InclinationO.y')) - mid + ContraryO + (BeatModY * BeatFactY) + (OBeatModY * OBeatFactY) + OpStrumY  + getProperty('Strum2.y') * -InvertOFactor * InvertO1 * inDown
        yOnotMods2 = Ubic0y + yOpNote2 + (OshakeY2 * (getProperty('ShakeO.y') + getProperty('Shake.y'))) + (YnotePtip2 * (tipFactY + getProperty('TipsyO.y') * 2)) + (InclinationO + getProperty('InclinationO.y'))/3 - Bulge - ContraryO + Rad + (BeatModY * BeatFactY) + (OBeatModY * OBeatFactY) + OpStrumY + getProperty('Strum2.y') * -InvertOFactor * InvertO2 * inDown
        yOnotMods3 = Ubic0y + yOpNote3 + (OshakeY3 * (getProperty('ShakeO.y') + getProperty('Shake.y'))) + (YnotePtip3 * (tipFactY + getProperty('TipsyO.y') * 2)) - (InclinationO + getProperty('InclinationO.y'))/3 - Bulge + ContraryO - Rad + (BeatModY * BeatFactY) + (OBeatModY * OBeatFactY) + OpStrumY + getProperty('Strum2.y') * -InvertOFactor * InvertO3 * inDown 
        yOnotMods4 = Ubic0y + yOpNote4 + (OshakeY4 * (getProperty('ShakeO.y') + getProperty('Shake.y'))) + (YnotePtip4 * (tipFactY + getProperty('TipsyO.y') * 2)) - (InclinationO + getProperty('InclinationO.y')) - mid - ContraryO + (BeatModY * BeatFactY) + (OBeatModY * OBeatFactY) + OpStrumY + getProperty('Strum2.y') * -InvertOFactor * InvertO4 * inDown

        theZfix = 3.14 + getProperty('Deepness.y')/-30

        for i = 0, getProperty('playerStrums.length')-1 do
            setPropertyFromGroup('playerStrums', 0, 'y', (yPnotMods1) * (Zpl1/divZ) - pNot1Z * theZfix)
            setPropertyFromGroup('playerStrums', 1, 'y', (yPnotMods2) * (Zpl2/divZ) - pNot2Z * theZfix)
            setPropertyFromGroup('playerStrums', 2, 'y', (yPnotMods3) * (Zpl3/divZ) - pNot3Z * theZfix)
            setPropertyFromGroup('playerStrums', 3, 'y', (yPnotMods4) * (Zpl4/divZ) - pNot4Z * theZfix)
        end
    
        for i = 0, getProperty('opponentStrums.length')-1 do
            setPropertyFromGroup('opponentStrums', 0, 'y', (yOnotMods1) * (Zop1/divZ) - oNot1Z * theZfix)
            setPropertyFromGroup('opponentStrums', 1, 'y', (yOnotMods2) * (Zop2/divZ) - oNot2Z * theZfix)
            setPropertyFromGroup('opponentStrums', 2, 'y', (yOnotMods3) * (Zop3/divZ) - oNot3Z * theZfix)
            setPropertyFromGroup('opponentStrums', 3, 'y', (yOnotMods4) * (Zop4/divZ) - oNot4Z * theZfix)
        end

        -- X
        ExpandLogicP = (115 * (getProperty('ExpandP.x') + getProperty('Expand.x')) * (ZspinXp * spinXp))
        ExpandLogicO = (115 * (getProperty('ExpandO.x') + getProperty('Expand.x')) * (ZspinXo * spinXo))

        Ubic0x = 581

        onCrossP = (getProperty('Cross.x') + getProperty('CrossP.x'))
        onCrossO = (getProperty('Cross.x') + getProperty('CrossO.x'))

        tipFactX = getProperty('Tipsy.x') * 2

        BeatModX = getProperty('ReceptorBeat.x')
        PBeatModX = getProperty('RecBtP.x')
        OBeatModX = getProperty('RecBtO.x')

        BeatFactX = getProperty('Beating.x') * 10
        PBeatFactX = getProperty('BeatingP.x') * 10
        OBeatFactX = getProperty('BeatingO.x') * 10

        PshakeX1 = getProperty('Pshake1.x')
        PshakeX2 = getProperty('Pshake2.x')
        PshakeX3 = getProperty('Pshake3.x')
        PshakeX4 = getProperty('Pshake4.x')

        OshakeX1 = getProperty('Oshake1.x')
        OshakeX2 = getProperty('Oshake2.x')
        OshakeX3 = getProperty('Oshake3.x')
        OshakeX4 = getProperty('Oshake4.x')

        xPnotMods1 = Ubic0x + xPlNote1 + (PshakeX1 * (getProperty('ShakeP.x') + getProperty('Shake.x'))) + (XnotePtip1 * (tipFactX + getProperty('TipsyP.x') * 2)) + onCrossP - ExpandLogicP - (ExpandLogicP/2) - Rad + (BeatModX * BeatFactX) + (PBeatModX * PBeatFactX) + PlStrumX + getProperty('Strum1.x') * SwapFactor
        xPnotMods2 = Ubic0x + xPlNote2 + (PshakeX2 * (getProperty('ShakeP.x') + getProperty('Shake.x'))) + (XnotePtip2 * (tipFactX + getProperty('TipsyP.x') * 2)) - onCrossP - (ExpandLogicP/2) + (BeatModX * BeatFactX) + (PBeatModX * PBeatFactX) + PlStrumX + getProperty('Strum1.x') * SwapFactor
        xPnotMods3 = Ubic0x + xPlNote3 + (PshakeX3 * (getProperty('ShakeP.x') + getProperty('Shake.x'))) + (XnotePtip3 * (tipFactX + getProperty('TipsyP.x') * 2)) + onCrossP + (ExpandLogicP/2) + (BeatModX * BeatFactX) + (PBeatModX * PBeatFactX) + PlStrumX + getProperty('Strum1.x') * SwapFactor
        xPnotMods4 = Ubic0x + xPlNote4 + (PshakeX4 * (getProperty('ShakeP.x') + getProperty('Shake.x'))) + (XnotePtip4 * (tipFactX + getProperty('TipsyP.x') * 2)) - onCrossP + ExpandLogicP + (ExpandLogicP/2) + Rad + (BeatModX * BeatFactX) + (PBeatModX * PBeatFactX) + PlStrumX + getProperty('Strum1.x') * SwapFactor

        xOnotMods1 = Ubic0x + xOpNote1 + (OshakeX1 * (getProperty('ShakeO.x') + getProperty('Shake.x'))) + (XnoteOtip1 * (tipFactX + getProperty('TipsyO.x') * 2)) + onCrossO - ExpandLogicO - (ExpandLogicO/2) - Rad + (BeatModX * BeatFactX) + (OBeatModX * OBeatFactX) + OpStrumX + getProperty('Strum2.x') * SwapFactor
        xOnotMods2 = Ubic0x + xOpNote2 + (OshakeX2 * (getProperty('ShakeO.x') + getProperty('Shake.x'))) + (XnoteOtip2 * (tipFactX + getProperty('TipsyO.x') * 2)) - onCrossO - (ExpandLogicO/2) + (BeatModX * BeatFactX) + (OBeatModX * OBeatFactX) + OpStrumX + getProperty('Strum2.x') * SwapFactor
        xOnotMods3 = Ubic0x + xOpNote3 + (OshakeX3 * (getProperty('ShakeO.x') + getProperty('Shake.x'))) + (XnoteOtip3 * (tipFactX + getProperty('TipsyO.x') * 2)) + onCrossO + (ExpandLogicO/2) + (BeatModX * BeatFactX) + (OBeatModX * OBeatFactX) + OpStrumX + getProperty('Strum2.x') * SwapFactor
        xOnotMods4 = Ubic0x + xOpNote4 + (OshakeX4 * (getProperty('ShakeO.x') + getProperty('Shake.x'))) + (XnoteOtip4 * (tipFactX + getProperty('TipsyO.x') * 2)) - onCrossO + ExpandLogicO + (ExpandLogicO/2) + Rad + (BeatModX * BeatFactX) + (OBeatModX * OBeatFactX) + OpStrumX + getProperty('Strum2.x') * SwapFactor

        theZfix2 = 5.8 + getProperty('Deepness.x')/-10

        for i = 0, getProperty('playerStrums.length') - 1 do
            setPropertyFromGroup('playerStrums', 0, 'x', (xPnotMods1) * (Zpl1/divZ) - pNot1Z * theZfix2)
            setPropertyFromGroup('playerStrums', 1, 'x', (xPnotMods2) * (Zpl2/divZ) - pNot2Z * theZfix2)
            setPropertyFromGroup('playerStrums', 2, 'x', (xPnotMods3) * (Zpl3/divZ) - pNot3Z * theZfix2)
            setPropertyFromGroup('playerStrums', 3, 'x', (xPnotMods4) * (Zpl4/divZ) - pNot4Z * theZfix2)
        end
        
        for i = 0, getProperty('opponentStrums.length') - 1 do
            setPropertyFromGroup('opponentStrums', 0, 'x', (xOnotMods1) * (Zop1/divZ) - oNot1Z * theZfix2)
            setPropertyFromGroup('opponentStrums', 1, 'x', (xOnotMods2) * (Zop2/divZ) - oNot2Z * theZfix2)
            setPropertyFromGroup('opponentStrums', 2, 'x', (xOnotMods3) * (Zop3/divZ) - oNot3Z * theZfix2)
            setPropertyFromGroup('opponentStrums', 3, 'x', (xOnotMods4) * (Zop4/divZ) - oNot4Z * theZfix2)
        end
    end

    if AngleNotes == true then

        angLockP = getProperty('camHUD.angle') * getProperty('lockAngP.x')
        angLockO = getProperty('camHUD.angle') * getProperty('lockAngO.x')

        angOpNote1 = getProperty('OPnote1.angle') + getProperty('Obump1.angle') + getProperty('OpStrum.angle') + getProperty('AngleStrum.angle') - angLockO - (angSpinO * getProperty('AngOnSpinO.angle')) - mid
        angOpNote2 = getProperty('OPnote2.angle') + getProperty('Obump2.angle') + getProperty('OpStrum.angle') + getProperty('AngleStrum.angle') - angLockO - (angSpinO * getProperty('AngOnSpinO.angle')) - Bulge/2
        angOpNote3 = getProperty('OPnote3.angle') + getProperty('Obump3.angle') + getProperty('OpStrum.angle') + getProperty('AngleStrum.angle') - angLockO - (angSpinO * getProperty('AngOnSpinO.angle')) - Bulge/2
        angOpNote4 = getProperty('OPnote4.angle') + getProperty('Obump4.angle') + getProperty('OpStrum.angle') + getProperty('AngleStrum.angle') - angLockO - (angSpinO * getProperty('AngOnSpinO.angle')) + mid

        angPlNote1 = getProperty('PLnote1.angle') + getProperty('Pbump1.angle') + getProperty('PlStrum.angle') + getProperty('AngleStrum.angle') - angLockP - (angSpinP * getProperty('AngOnSpinP.angle')) - mid
        angPlNote2 = getProperty('PLnote2.angle') + getProperty('Pbump2.angle') + getProperty('PlStrum.angle') + getProperty('AngleStrum.angle') - angLockP - (angSpinP * getProperty('AngOnSpinP.angle')) - Bulge/2
        angPlNote3 = getProperty('PLnote3.angle') + getProperty('Pbump3.angle') + getProperty('PlStrum.angle') + getProperty('AngleStrum.angle') - angLockP - (angSpinP * getProperty('AngOnSpinP.angle')) - Bulge/2
        angPlNote4 = getProperty('PLnote4.angle') + getProperty('Pbump4.angle') + getProperty('PlStrum.angle') + getProperty('AngleStrum.angle') - angLockP - (angSpinP * getProperty('AngOnSpinP.angle')) + mid

        setPropertyFromGroup('playerStrums', 0, 'angle', angPlNote1)
        setPropertyFromGroup('playerStrums', 1, 'angle', angPlNote2)
        setPropertyFromGroup('playerStrums', 2, 'angle', angPlNote3)
        setPropertyFromGroup('playerStrums', 3, 'angle', angPlNote4)

        setPropertyFromGroup('opponentStrums', 0, 'angle', angOpNote1)
        setPropertyFromGroup('opponentStrums', 1, 'angle', angOpNote2)
        setPropertyFromGroup('opponentStrums', 2, 'angle', angOpNote3)
        setPropertyFromGroup('opponentStrums', 3, 'angle', angOpNote4)
    end

    if SizeNotes == true then

        dSc = 1.4

        local base = getProperty('IsPixelNote.x') + getProperty('Scale.angle')/dSc
        local strumScaleX = base + getProperty('Scale.x')/dSc
        local strumScaleY = base + getProperty('Scale.y')/dSc

        local xScaleP, yScaleP, xScaleO, yScaleO = {}, {}, {}, {}
        local zP = {Zpl1, Zpl2, Zpl3, Zpl4}
        local zO = {Zop1, Zop2, Zop3, Zop4}

        for i = 1, 4 do
            local pProp = 'PnotScale'..i
            local oProp = 'OnotScale'..i
    
            xScaleP[i] = getProperty(pProp..'.x')/dSc + strumScaleX + getProperty('ScaleP.x')/10 + getProperty('ScaleP.angle')/10 + getProperty(pProp..'.angle')/dSc
            yScaleP[i] = getProperty(pProp..'.y')/dSc + strumScaleY + getProperty('ScaleP.y')/10 + getProperty('ScaleP.angle')/10 + getProperty(pProp..'.angle')/dSc
            xScaleO[i] = getProperty(oProp..'.x')/dSc + strumScaleX + getProperty('ScaleO.x')/10 + getProperty('ScaleO.angle')/10 + getProperty(oProp..'.angle')/dSc
            yScaleO[i] = getProperty(oProp..'.y')/dSc + strumScaleY + getProperty('ScaleO.y')/10 + getProperty('ScaleO.angle')/10 + getProperty(oProp..'.angle')/dSc

            setPropertyFromGroup('playerStrums', i-1, 'scale.x', xScaleP[i] * zP[i]/divZ)
            setPropertyFromGroup('playerStrums', i-1, 'scale.y', yScaleP[i] * zP[i]/divZ)
            setPropertyFromGroup('opponentStrums', i-1, 'scale.x', xScaleO[i] * zO[i]/divZ)
            setPropertyFromGroup('opponentStrums', i-1, 'scale.y', yScaleO[i] * zO[i]/divZ)
        end

        for i = 0, getProperty('notes.length') - 1 do
            local noteData = getPropertyFromGroup('notes', i, 'noteData') + 1
            local scales = getPropertyFromGroup('notes', i, 'mustPress') and {xScaleP, yScaleP, zP} or {xScaleO, yScaleO, zO}

            local curScX = getPropertyFromGroup('notes', i, 'scale.x')
            local curScY = getPropertyFromGroup('notes', i, 'scale.y')

            if not getPropertyFromGroup('notes', i, 'isSustainNote') then
                setPropertyFromGroup('notes', i, 'scale.x', scales[1][noteData] * scales[3][noteData]/divZ)
                setPropertyFromGroup('notes', i, 'scale.y', scales[2][noteData] * scales[3][noteData]/divZ)
            end

            if getPropertyFromGroup('notes', i, 'isSustainNote') then
                setPropertyFromGroup('notes', i, 'scale.x', scales[1][noteData] * scales[3][noteData]/divZ)
            end
        end
    end

    if Tipsy then

        TipsyXspeed = getProperty('SPDTipsy.x')
        TipsyYspeed = getProperty('SPDTipsy.y')
        TipsyZspeed = getProperty('SPDTipsy.angle')

        TXint = 2
        TYint = 2
        TZint = 2

        remapingX = getProperty('TipRemaping.x')
        remapingY = getProperty('TipRemaping.y')
        remapingZ = getProperty('TipRemaping.angle')

        local currentBeatTipX = (songPos/5000)*(curBpm/TipsyXspeed)
        local currentBeatTipY = (songPos/5000)*(curBpm/TipsyYspeed)
        local currentBeatTipZ = (songPos/5000)*(curBpm/TipsyZspeed)

        local fZ = getProperty('fZ.x');

        --Player
        doTweenX('Xnotep1', 'tipPnot1', TXint * math.sin((currentBeatTipX + 0 * remapingX * 0.25) * math.pi), instaT, 'sineInOut')
        doTweenX('Xnotep2', 'tipPnot2', TXint * math.sin((currentBeatTipX + 1 * remapingX * 0.25) * math.pi), instaT, 'sineInOut')
        doTweenX('Xnotep3', 'tipPnot3', TXint * math.sin((currentBeatTipX + 2 * remapingX * 0.25) * math.pi), instaT, 'sineInOut')
        doTweenX('Xnotep4', 'tipPnot4', TXint * math.sin((currentBeatTipX + 3 * remapingX * 0.25) * math.pi), instaT, 'sineInOut')

        doTweenY('Ynotep1', 'tipPnot1', TYint * math.cos((currentBeatTipY + 4 * remapingY * 0.25) * math.pi), instaT, 'sineInOut')
        doTweenY('Ynotep2', 'tipPnot2', TYint * math.cos((currentBeatTipY + 5 * remapingY * 0.25) * math.pi), instaT, 'sineInOut')
        doTweenY('Ynotep3', 'tipPnot3', TYint * math.cos((currentBeatTipY + 6 * remapingY * 0.25) * math.pi), instaT, 'sineInOut')
        doTweenY('Ynotep4', 'tipPnot4', TYint * math.cos((currentBeatTipY + 7 * remapingY * 0.25) * math.pi), instaT, 'sineInOut')

        --Z
        if fZ == 1 then
            doTweenX('Znotep1', 'TipPnotZ1', TZint * math.sin((currentBeatTipZ + 0 * remapingZ * 0.25) * math.pi), instaT, 'sineInOut')
            doTweenX('Znotep2', 'TipPnotZ2', TZint * math.sin((currentBeatTipZ + 1 * remapingZ * 0.25) * math.pi), instaT, 'sineInOut')
            doTweenX('Znotep3', 'TipPnotZ3', TZint * math.sin((currentBeatTipZ + 2 * remapingZ * 0.25) * math.pi), instaT, 'sineInOut')
            doTweenX('Znotep4', 'TipPnotZ4', TZint * math.sin((currentBeatTipZ + 3 * remapingZ * 0.25) * math.pi), instaT, 'sineInOut')
        elseif fZ == 2 then
            doTweenX('Znotep1', 'TipPnotZ1', TZint * math.cos((currentBeatTipZ + 0 * remapingZ * 0.25) * math.pi), instaT, 'sineInOut')
            doTweenX('Znotep2', 'TipPnotZ2', TZint * math.cos((currentBeatTipZ + 1 * remapingZ * 0.25) * math.pi), instaT, 'sineInOut')
            doTweenX('Znotep3', 'TipPnotZ3', TZint * math.cos((currentBeatTipZ + 2 * remapingZ * 0.25) * math.pi), instaT, 'sineInOut')
            doTweenX('Znotep4', 'TipPnotZ4', TZint * math.cos((currentBeatTipZ + 3 * remapingZ * 0.25) * math.pi), instaT, 'sineInOut')
        end

        --Oponent
        doTweenX('Xnoteo1', 'tipOnot1', TXint * math.sin((currentBeatTipX + 0 * remapingX * 0.25) * math.pi), instaT, 'sineInOut')
        doTweenX('Xnoteo2', 'tipOnot2', TXint * math.sin((currentBeatTipX + 1 * remapingX * 0.25) * math.pi), instaT, 'sineInOut')
        doTweenX('Xnoteo3', 'tipOnot3', TXint * math.sin((currentBeatTipX + 2 * remapingX * 0.25) * math.pi), instaT, 'sineInOut')
        doTweenX('Xnoteo4', 'tipOnot4', TXint * math.sin((currentBeatTipX + 3 * remapingX * 0.25) * math.pi), instaT, 'sineInOut')

        doTweenY('Ynoteo1', 'tipOnot1', TYint * math.cos((currentBeatTipY + 4 * remapingY * 0.25) * math.pi), instaT, 'sineInOut')
        doTweenY('Ynoteo2', 'tipOnot2', TYint * math.cos((currentBeatTipY + 5 * remapingY * 0.25) * math.pi), instaT, 'sineInOut')
        doTweenY('Ynoteo3', 'tipOnot3', TYint * math.cos((currentBeatTipY + 6 * remapingY * 0.25) * math.pi), instaT, 'sineInOut')
        doTweenY('Ynoteo4', 'tipOnot4', TYint * math.cos((currentBeatTipY + 7 * remapingY * 0.25) * math.pi), instaT, 'sineInOut')

        --Z
        if fZ == 1 then
            doTweenX('ZnoteO1', 'TipOnotZ1', TZint * math.sin((currentBeatTipZ + 0 * remapingZ * 0.25) * math.pi), instaT, 'sineInOut')
            doTweenX('ZnoteO2', 'TipOnotZ2', TZint * math.sin((currentBeatTipZ + 1 * remapingZ * 0.25) * math.pi), instaT, 'sineInOut')
            doTweenX('ZnoteO3', 'TipOnotZ3', TZint * math.sin((currentBeatTipZ + 2 * remapingZ * 0.25) * math.pi), instaT, 'sineInOut')
            doTweenX('ZnoteO4', 'TipOnotZ4', TZint * math.sin((currentBeatTipZ + 3 * remapingZ * 0.25) * math.pi), instaT, 'sineInOut')
        elseif fZ == 2 then
            doTweenX('ZnoteO1', 'TipOnotZ1', TZint * math.cos((currentBeatTipZ + 0 * remapingZ * 0.25) * math.pi), instaT, 'sineInOut')
            doTweenX('ZnoteO2', 'TipOnotZ2', TZint * math.cos((currentBeatTipZ + 1 * remapingZ * 0.25) * math.pi), instaT, 'sineInOut')
            doTweenX('ZnoteO3', 'TipOnotZ3', TZint * math.cos((currentBeatTipZ + 2 * remapingZ * 0.25) * math.pi), instaT, 'sineInOut')
            doTweenX('ZnoteO4', 'TipOnotZ4', TZint * math.cos((currentBeatTipZ + 3 * remapingZ * 0.25) * math.pi), instaT, 'sineInOut')
        end
    end

    if Opacity == true then
        OpFade = getProperty('OpStrum.alpha')
        PlFade = getProperty('PlStrum.alpha')

        for i = 0, getProperty('notes.length')-1 do
            setPropertyFromGroup('playerStrums', i, 'alpha', PlFade)
            setPropertyFromGroup('opponentStrums', i, 'alpha', OpFade)
        end
    end

    if Direction == true then
        Odir1 = ((getProperty('dirO.angle') + getProperty('dirO1.angle')) - (angSpinO * getProperty('DirOnSpinP.angle')))
        Odir2 = ((getProperty('dirO.angle') + getProperty('dirO2.angle')) - (angSpinO * getProperty('DirOnSpinP.angle')))
        Odir3 = ((getProperty('dirO.angle') + getProperty('dirO3.angle')) - (angSpinO * getProperty('DirOnSpinP.angle')))
        Odir4 = ((getProperty('dirO.angle') + getProperty('dirO4.angle')) - (angSpinO * getProperty('DirOnSpinP.angle')))

        Pdir1 = ((getProperty('dirP.angle') + getProperty('dirP1.angle')) - (angSpinP * getProperty('DirOnSpinO.angle')))
        Pdir2 = ((getProperty('dirP.angle') + getProperty('dirP2.angle')) - (angSpinP * getProperty('DirOnSpinO.angle')))
        Pdir3 = ((getProperty('dirP.angle') + getProperty('dirP3.angle')) - (angSpinP * getProperty('DirOnSpinO.angle')))
        Pdir4 = ((getProperty('dirP.angle') + getProperty('dirP4.angle')) - (angSpinP * getProperty('DirOnSpinO.angle')))

        noteTweenDirection('notOP1', 0, 90 + Odir1, instaT, 'circOut')
        noteTweenDirection('notOP2', 1, 90 + Odir2, instaT, 'circOut')
        noteTweenDirection('notOP3', 2, 90 + Odir3, instaT, 'circOut')
        noteTweenDirection('notOP4', 3, 90 + Odir4, instaT, 'circOut')

        noteTweenDirection('notPl1', 4, -270 + Pdir1, instaT, 'circOut')
        noteTweenDirection('notPl2', 5, -270 + Pdir2, instaT, 'circOut')
        noteTweenDirection('notPl3', 6, -270 + Pdir3, instaT, 'circOut')
        noteTweenDirection('notPl4', 7, -270 + Pdir4, instaT, 'circOut')
    end

    if Bump == true then

        timeBack = stepCrochet*0.004

        BumpX = getProperty('Bump.x')
        BumpY = getProperty('Bump.y')
        BumpZ = getProperty('zBump.x')
        BumpAng = getProperty('Bump.angle')

        doBumpX = false
        doBumpY = false
        doBumpZ = false
        doBumpAng = false

        if BumpX > 0 then
            doBumpX = true
        elseif BumpX == 0 then
            doBumpX = false
        end

        if doBumpX == true then
            setProperty('Pbump1.x', getRandomInt(-BumpX,BumpX))
            setProperty('Pbump2.x', getRandomInt(-BumpX,BumpX))
            setProperty('Pbump3.x', getRandomInt(-BumpX,BumpX))
            setProperty('Pbump4.x', getRandomInt(-BumpX,BumpX))

            setProperty('Obump1.x', getRandomInt(-BumpX,BumpX))
            setProperty('Obump2.x', getRandomInt(-BumpX,BumpX))
            setProperty('Obump3.x', getRandomInt(-BumpX,BumpX))
            setProperty('Obump4.x', getRandomInt(-BumpX,BumpX))

            doTweenX('backP1', 'Pbump1', 0, timeBack, 'circOut')
            doTweenX('backP2', 'Pbump2', 0, timeBack, 'circOut')
            doTweenX('backP3', 'Pbump3', 0, timeBack, 'circOut')
            doTweenX('backP4', 'Pbump4', 0, timeBack, 'circOut')

            doTweenX('backO1', 'Obump1', 0, timeBack, 'circOut')
            doTweenX('backO2', 'Obump2', 0, timeBack, 'circOut')
            doTweenX('backO3', 'Obump3', 0, timeBack, 'circOut')
            doTweenX('backO4', 'Obump4', 0, timeBack, 'circOut')

            setProperty('Bump.x', 0)
        end

        if BumpY > 0 then
            doBumpY = true
        elseif BumpY == 0 then
            doBumpY = false
        end

        if doBumpY == true then
            setProperty('Pbump1.y', getRandomInt(-BumpY,BumpY))
            setProperty('Pbump2.y', getRandomInt(-BumpY,BumpY))
            setProperty('Pbump3.y', getRandomInt(-BumpY,BumpY))
            setProperty('Pbump4.y', getRandomInt(-BumpY,BumpY))
            
            setProperty('Obump1.y', getRandomInt(-BumpY,BumpY))
            setProperty('Obump2.y', getRandomInt(-BumpY,BumpY))
            setProperty('Obump3.y', getRandomInt(-BumpY,BumpY))
            setProperty('Obump4.y', getRandomInt(-BumpY,BumpY))

            doTweenY('YbackP1', 'Pbump1', 0, timeBack, 'circOut')
            doTweenY('YbackP2', 'Pbump2', 0, timeBack, 'circOut')
            doTweenY('YbackP3', 'Pbump3', 0, timeBack, 'circOut')
            doTweenY('YbackP4', 'Pbump4', 0, timeBack, 'circOut')

            doTweenY('YbackO1', 'Obump1', 0, timeBack, 'circOut')
            doTweenY('YbackO2', 'Obump2', 0, timeBack, 'circOut')
            doTweenY('YbackO3', 'Obump3', 0, timeBack, 'circOut')
            doTweenY('YbackO4', 'Obump4', 0, timeBack, 'circOut')

            setProperty('Bump.y', 0)
        end

        if BumpZ > 0 then
            doBumpZ = true
        elseif BumpZ == 0 then
            doBumpZ = false
        end

        if doBumpZ == true then
            setProperty('zPbump1.x', getRandomInt(-BumpZ,BumpZ))
            setProperty('zPbump2.x', getRandomInt(-BumpZ,BumpZ))
            setProperty('zPbump3.x', getRandomInt(-BumpZ,BumpZ))
            setProperty('zPbump4.x', getRandomInt(-BumpZ,BumpZ))

            setProperty('zObump1.x', getRandomInt(-BumpZ,BumpZ))
            setProperty('zObump2.x', getRandomInt(-BumpZ,BumpZ))
            setProperty('zObump3.x', getRandomInt(-BumpZ,BumpZ))
            setProperty('zObump4.x', getRandomInt(-BumpZ,BumpZ))

            doTweenX('ZbackP1', 'zPbump1', 0, timeBack, 'circOut')
            doTweenX('ZbackP2', 'zPbump2', 0, timeBack, 'circOut')
            doTweenX('ZbackP3', 'zPbump3', 0, timeBack, 'circOut')
            doTweenX('ZbackP4', 'zPbump4', 0, timeBack, 'circOut')

            doTweenX('ZbackO1', 'zObump1', 0, timeBack, 'circOut')
            doTweenX('ZbackO2', 'zObump2', 0, timeBack, 'circOut')
            doTweenX('ZbackO3', 'zObump3', 0, timeBack, 'circOut')
            doTweenX('ZbackO4', 'zObump4', 0, timeBack, 'circOut')

            setProperty('zBump.x', 0)
        end

        if BumpAng > 0 then
            doBumpAng = true
        elseif BumpAng == 0 then
            doBumpAng = false
        end

        if doBumpAng == true then
            setProperty('Pbump1.angle', getRandomInt(-BumpAng,BumpAng))
            setProperty('Pbump2.angle', getRandomInt(-BumpAng,BumpAng))
            setProperty('Pbump3.angle', getRandomInt(-BumpAng,BumpAng))
            setProperty('Pbump4.angle', getRandomInt(-BumpAng,BumpAng))

            setProperty('Obump1.angle', getRandomInt(-BumpAng,BumpAng))
            setProperty('Obump2.angle', getRandomInt(-BumpAng,BumpAng))
            setProperty('Obump3.angle', getRandomInt(-BumpAng,BumpAng))
            setProperty('Obump4.angle', getRandomInt(-BumpAng,BumpAng))

            doTweenAngle('angbackP1', 'Pbump1', 0, timeBack, 'circOut')
            doTweenAngle('angbackP2', 'Pbump2', 0, timeBack, 'circOut')
            doTweenAngle('angbackP3', 'Pbump3', 0, timeBack, 'circOut')
            doTweenAngle('angbackP4', 'Pbump4', 0, timeBack, 'circOut')

            doTweenAngle('angbackO1', 'Obump1', 0, timeBack, 'circOut')
            doTweenAngle('angbackO2', 'Obump2', 0, timeBack, 'circOut')
            doTweenAngle('angbackO3', 'Obump3', 0, timeBack, 'circOut')
            doTweenAngle('angbackO4', 'Obump4', 0, timeBack, 'circOut')

            setProperty('Bump.angle', 0)
        end
    end

    if Shake then
        setProperty('Pshake1.angle', getRandomInt(1,-1))
        setProperty('Pshake2.angle', getRandomInt(1,-1))
        setProperty('Pshake3.angle', getRandomInt(1,-1))
        setProperty('Pshake4.angle', getRandomInt(1,-1))

        setProperty('Oshake1.angle', getRandomInt(1,-1))
        setProperty('Oshake2.angle', getRandomInt(1,-1))
        setProperty('Oshake3.angle', getRandomInt(1,-1))
        setProperty('Oshake4.angle', getRandomInt(1,-1))

        setProperty('Pshake1.x', getRandomInt(1,-1))
        setProperty('Pshake2.x', getRandomInt(1,-1))
        setProperty('Pshake3.x', getRandomInt(1,-1))
        setProperty('Pshake4.x', getRandomInt(1,-1))

        setProperty('Oshake1.x', getRandomInt(1,-1))
        setProperty('Oshake2.x', getRandomInt(1,-1))
        setProperty('Oshake3.x', getRandomInt(1,-1))
        setProperty('Oshake4.x', getRandomInt(1,-1))

        setProperty('Pshake1.y', getRandomInt(1,-1))
        setProperty('Pshake2.y', getRandomInt(1,-1))
        setProperty('Pshake3.y', getRandomInt(1,-1))
        setProperty('Pshake4.y', getRandomInt(1,-1))

        setProperty('Oshake1.y', getRandomInt(1,-1))
        setProperty('Oshake2.y', getRandomInt(1,-1))
        setProperty('Oshake3.y', getRandomInt(1,-1))
        setProperty('Oshake4.y', getRandomInt(1,-1))
    end

    if CameraEffects == true then

        AngleModx = getProperty('AngleCam.x')
        AngleMody = getProperty('AngleCam.y')

        AngleMod = getProperty('AngleCam.angle')

        drunkCamAng = getProperty('camDrunkF.angle') * getProperty('camDrunk.angle')
        drunkCamX = getProperty('camDrunkF.x') * getProperty('camDrunk.x')
        drunkCamY = getProperty('camDrunkF.y') * getProperty('camDrunk.y')

        swimCamX = getProperty('cSwimFact.x') * getProperty('camSwim.x')
        swimCamY = getProperty('cSwimFact.y') * getProperty('camSwim.y')
        swimCamZoom = getProperty('cSwimFact.angle') * getProperty('camSwim.angle')

        BeatCamAng = getProperty('cBeatFact.angle') * getProperty('camBeat.angle')
        BeatCamXang = getProperty('cBeatFact.x') * getProperty('camBeat.x')
        BeatCamYang = getProperty('cBeatFact.y') * getProperty('camBeat.y')

        ZoomFx = getProperty('camZoom.x') + (getProperty('cZoombeatFact.x') * (getProperty('ZoomBeat.x')/10)) +  (swimCamZoom/100)

        XcamMods = swimCamX
        YcamMods = swimCamY

        setProperty('cMultiAng.x', AngleModx + drunkCamX + BeatCamXang)
        setProperty('cMultiAng.y', AngleMody + drunkCamY + BeatCamYang)

        setProperty('camHUD.angle', AngleMod + drunkCamAng + BeatCamAng)
        setProperty('camHUD.zoom', ZoomFx)

        setProperty('camHUD.x', XcamMods)
        setProperty('camHUD.y', YcamMods)

        spdDrunkANG = getProperty('camDrunkSPD.angle')
        spdDrunkX = getProperty('camDrunkSPD.x')
        spdDrunkY = getProperty('camDrunkSPD.y')

        spdSwimX = getProperty('camSwimSPD.x')
        spdSwimY = getProperty('camSwimSPD.y')
        spdSwimZoom = getProperty('camSwimSPD.angle')

        local cbDrunkAng = (songPos/5000)*(curBpm/(spdDrunkANG/10))
        local cbDrunkX = (songPos/5000)*(curBpm/(spdDrunkX/10))
        local cbDrunkY = (songPos/5000)*(curBpm/(spdDrunkY/10))

        local cbSwimX = (songPos/5000)*(curBpm/(spdSwimX/10))
        local cbSwimY = (songPos/5000)*(curBpm/(spdSwimY/10))
        local cbSwimZoom = (songPos/5000)*(curBpm/(spdSwimZoom/10))

        doTweenAngle('tagDrunkAngCam', 'camDrunkF', 1 * math.sin((cbDrunkAng * 0.25) * math.pi), instaT, 'sineInOut')
        doTweenX('tagDrunkXCam', 'camDrunkF', 1 * math.sin((cbDrunkX * 0.25) * math.pi), instaT, 'sineInOut')
        doTweenY('tagDrunkYCam', 'camDrunkF', 1 * math.cos((cbDrunkY * 0.25) * math.pi), instaT, 'sineInOut')

        doTweenX('tagSwimXCam', 'cSwimFact', 1 * math.sin((cbSwimX * 0.25) * math.pi), instaT, 'sineInOut')
        doTweenY('tagSwimYCam', 'cSwimFact', 1 * math.cos((cbSwimX * 0.25) * math.pi), instaT, 'sineInOut')
        doTweenAngle('tagSwimZoomCam', 'cSwimFact', 1 * math.cos((cbSwimZoom * 0.25) * math.pi), instaT, 'sineInOut')
    end

    --Sustain Logic
    if not sustainDef then
        pcall(function()
            local notesLength = getProperty('notes.length')
            if not notesLength or notesLength <= 0 then return end

            local sustains = {}
            for i = 0, notesLength - 1 do
                local ok, isS = pcall(function() return getPropertyFromGroup('notes', i, 'isSustainNote') end)
                if ok and isS then
                    local s = {
                        idx = i,
                        x = getPropertyFromGroup('notes', i, 'x') or 0,
                        y = getPropertyFromGroup('notes', i, 'y') or 0,
                        lane = getPropertyFromGroup('notes', i, 'noteData') or 0,
                        mustPress = getPropertyFromGroup('notes', i, 'mustPress') or false,
                        strumTime = getPropertyFromGroup('notes', i, 'strumTime') or 0
                    }
                    table.insert(sustains, s)
                end
            end

            if #sustains == 0 then return end

            local buckets = {}
            for _, s in ipairs(sustains) do
                local key = s.lane .. '_' .. (s.mustPress and 'p' or 'o')
                buckets[key] = buckets[key] or {}
                table.insert(buckets[key], s)
            end

            for _, list in pairs(buckets) do
                table.sort(list, function(a, b) return a.strumTime < b.strumTime end)

                for idx = 1, #list do
                    local cur = list[idx]
                    local prev = list[idx - 1]
                    local next = list[idx + 1]

                    local angle = 0
                    if prev and next then
                        local a1 = getAngle(prev.x, prev.y, cur.x, cur.y)
                        local a2 = getAngle(cur.x, cur.y, next.x, next.y)
                        angle = (a1 + a2) / 2
                    elseif prev then
                        angle = getAngle(prev.x, prev.y, cur.x, cur.y)
                    elseif next then
                        angle = getAngle(cur.x, cur.y, next.x, next.y)
                    else
                        angle = 0
                    end

                    local downscroll = cur.mustPress and getPropertyFromGroup('playerStrums', cur.lane, 'downScroll') or getPropertyFromGroup('opponentStrums', cur.lane, 'downScroll')
                    if downscroll then
                        setPropertyFromGroup('notes', cur.idx, 'angle', angle + 270)
                    else
                        setPropertyFromGroup('notes', cur.idx, 'angle', angle - 90)
                    end
                end
            end
        end)
    end

    if curStep >= 0 then
        setProperty('RecBtP.x', getProperty('ReceptorBeat.x'))
        setProperty('RecBtO.x', getProperty('ReceptorBeat.x'))
        setProperty('RecBtP.y', getProperty('ReceptorBeat.y'))
        setProperty('RecBtO.y', getProperty('ReceptorBeat.y'))
        setProperty('RecBtP.angle', getProperty('ReceptorBeat.angle'))
        setProperty('RecBtO.angle', getProperty('ReceptorBeat.angle'))
    end
end

function onBeatHit()

    timeBeat = (stepCrochet*0.0015) / 1.7

    if curBeat >= 1 then

        local tBeatBack = stepCrochet*0.004

        if curBeat % 2 == 0 then
            setProperty('cBeatFact.x', 1)
            setProperty('cBeatFact.y', 1)
            setProperty('cBeatFact.angle', 1)

            doTweenX('back1', 'cBeatFact', 0, tBeatBack, 'circOut')
            doTweenY('back2', 'cBeatFact', 0, tBeatBack, 'circOut')
            doTweenAngle('back3', 'cBeatFact', 0, tBeatBack, 'circOut')
        elseif curBeat % 2 == 1 then
            setProperty('cBeatFact.x', -1)
            setProperty('cBeatFact.y', -1)
            setProperty('cBeatFact.angle', -1)

            doTweenX('back1', 'cBeatFact', 0, tBeatBack, 'circOut')
            doTweenY('back2', 'cBeatFact', 0, tBeatBack, 'circOut')
            doTweenAngle('back3', 'cBeatFact', 0, tBeatBack, 'circOut')
        end

        if curBeat % 1 == 0 then
            setProperty('cZoombeatFact.x', 1)
            doTweenX('zoom1', 'cZoombeatFact', 0, tBeatBack, 'circOut')
        end
    end

    function onStepHit()

        BeatingID = getProperty('TypeBeat.x')

        if curStep >= 1 then
            if BeatingID == 0 then
                if curStep % 8 == 0 then
                    doTweenX('tagging1', 'ReceptorBeat', 0.5, timeBeat/1.5, 'sineInOut')
                    doTweenY('tagging2', 'ReceptorBeat', 0.5, timeBeat/1.5, 'sineInOut')
                elseif curStep % 8 == 1 then
                    doTweenX('tagging1', 'ReceptorBeat', 0.03, timeBeat/1.5, 'sineInOut')
                    doTweenY('tagging2', 'ReceptorBeat', 0.03, timeBeat/1.5, 'sineInOut')
                elseif curStep % 8 == 4 then
                    doTweenX('tagging1', 'ReceptorBeat', -0.5, timeBeat/1.5, 'sineInOut')
                    doTweenY('tagging2', 'ReceptorBeat', -0.5, timeBeat/1.5, 'sineInOut')
                elseif curStep % 8 == 5 then
                    doTweenX('tagging1', 'ReceptorBeat', -0.03, timeBeat/1.5, 'sineInOut')
                    doTweenY('tagging2', 'ReceptorBeat', -0.03, timeBeat/1.5, 'sineInOut')
                end
            elseif BeatingID == 1 then
                if curStep % 8 == 0 then
                    doTweenX('tagging1', 'ReceptorBeat', 0, stepCrochet*0.0025, 'circOut')
                    doTweenY('tagging2', 'ReceptorBeat', 0, stepCrochet*0.0025, 'circOut')
                elseif curStep % 8 == 2 then
                    doTweenX('tagging1', 'ReceptorBeat', 0.5, stepCrochet*0.002, 'circIn')
                    doTweenY('tagging2', 'ReceptorBeat', 0.5, stepCrochet*0.002, 'circIn')
                elseif curStep % 8 == 4 then
                    doTweenX('tagging1', 'ReceptorBeat', 0, stepCrochet*0.0025, 'circOut')
                    doTweenY('tagging2', 'ReceptorBeat', 0, stepCrochet*0.0025, 'circOut')
                elseif curStep % 8 == 6 then
                    doTweenX('tagging1', 'ReceptorBeat', -0.5, stepCrochet*0.002, 'circIn')
                    doTweenY('tagging2', 'ReceptorBeat', -0.5, stepCrochet*0.002, 'circIn')
                end
            elseif BeatingID == 2 then
                if curStep % 4 == 0 then
                    doTweenX('tagging1', 'ReceptorBeat', 0.5, stepCrochet*0.0025, 'circOut')
                    doTweenY('tagging2', 'ReceptorBeat', 0.5, stepCrochet*0.0025, 'circOut')
                elseif curStep % 4 == 2 then
                    doTweenX('tagging1', 'ReceptorBeat', -0.5, stepCrochet*0.002, 'circIn')
                    doTweenY('tagging2', 'ReceptorBeat', -0.5, stepCrochet*0.002, 'circIn')
                end
            end
        end

        if curStep >= 1 then
            if curStep % 4 == 0 then
                doTweenY('jump1', 'JumpFact', 1, timeBeat/2, 'circOut')
            elseif curStep % 4 == 2 then
                doTweenY('jump2', 'JumpFact', 0, timeBeat/2, 'circIn')
            end
        end
    end
end

--- Strum Layering function

function LayeringStrums()
    for i = 0, getProperty('strumLineNotes.length') - 1 do
        local sx = getPropertyFromGroup('strumLineNotes', i, 'scale.x')
        local sy = getPropertyFromGroup('strumLineNotes', i, 'scale.y')
        lastScales[i] = sx * sy
    end
end

-------------------------------------
---------Layering for notes----------
-------------------------------------

runHaxeCode([[
    var sortNotes = function() {

        var notes = game.notes.members;

        notes.sort(function(a, b) {
            if (a == null || b == null) return 0;

            var sizeA = a.scale.x * a.scale.y;
            var sizeB = b.scale.x * b.scale.y;

            if (a.isSustainNote && !b.isSustainNote) return -1;
            if (!a.isSustainNote && b.isSustainNote) return 1;

            if (sizeA < sizeB) return -1;
            if (sizeA > sizeB) return 1;

            if (a.strumTime < b.strumTime) return -1;
            if (a.strumTime > b.strumTime) return 1;
            
            return 0;
        });
    };

    game.variables.set('sortNotesFunc', sortNotes);
]]);

function onCreate()
    addLuaScript('luacam') -- newHUD

    addLuaScript('Shading Extension')
end

------------------Play test for modifiers------------------

function onStepHit()
    if curStep == 1 then
        --setProperty('PlStLines.x', 100)
    end
end
function onCreatePost()
    addLuaScript('Grooving Modchart Framework')
    --addLuaScript('Camera Move V2')
end

function onUpdate(elapsed)
    --if your notes are pixel--
    --setProperty('IsPixelNote.x', 5.5)

    --define Speeds--
    --PSdata : the speeds here can`t be 0
    if curStep == 0 then
        setProperty('DrunkRate.x', 300)
        setProperty('DrunkRate.y', 80)
        setProperty('DrunkRate.angle', 80)

        setProperty('SPDDrunk.x', 2)
        setProperty('SPDDrunk.y', 6)
        setProperty('SPDDrunk.angle', 2)
    
        setProperty('SPDTipsy.y', 20)
        setProperty('SPDTipsy.x', 120)
        setProperty('SPDTipsy.angle', 20)--z

        setProperty('TipRemaping.x', 0.5)
        setProperty('TipRemaping.y', 1)
        setProperty('TipRemaping.angle', 1)--z

        setProperty('SPDIncoming.x', 3)

        setProperty('Ease.angle', 1)

        setProperty('camDrunkSPD.angle', 30)
        setProperty('camDrunkSPD.x', 150)
        setProperty('camDrunkSPD.y', 150)

        setProperty('camSwimSPD.angle', 100) -- 30 for beat
        setProperty('camSwimSPD.x', 150)
        setProperty('camSwimSPD.y', 150)

        setProperty('lockAngP.x', 0)
        setProperty('lockAngO.x', 0)

        setProperty('camZoom.x', 0.9)
    end

    onElapsedTime()
end

local timeBeat = ((stepCrochet*0.018)/2)

function onSectionHit()
end

function onBeatHit()
end

function onStepHit()
end

function onElapsedTime()
end
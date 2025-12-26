╭━━━╮╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╭━╮╭━╮╱╱╱╱╭╮╱╱╭╮╱╱╱╱╱╱╭╮
--┃╭━╮┃╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱┃┃╰╯┃┃╱╱╱╱┃┃╱╱┃┃╱╱╱╱╱╭╯╰╮
--┃┃╱╰╋━┳━━┳━━┳╮╭┳┳━╮╭━━╮┃╭╮╭╮┣━━┳━╯┣━━┫╰━┳━━┳┻╮╭╯
--┃┃╭━┫╭┫╭╮┃╭╮┃╰╯┣┫╭╮┫╭╮┃┃┃┃┃┃┃╭╮┃╭╮┃╭━┫╭╮┃╭╮┃╭┫┃
--┃╰┻━┃┃┃╰╯┃╰╯┣╮╭┫┃┃┃┃╰╯┃┃┃┃┃┃┃╰╯┃╰╯┃╰━┫┃┃┃╭╮┃┃┃╰╮
--╰━━━┻╯╰━━┻━━╯╰╯╰┻╯╰┻━╮┃╰╯╰╯╰┻━━┻━━┻━━┻╯╰┻╯╰┻╯╰━╯
--╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╭━╯┃
--╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╰━━╯

Read this before Using
---
- You need to credit me if you gonna use this Tool for your mod
- Some Modifiers in code are broken or just there's no logic

Modifiers for notes:
---
- Drunk (x, y) // oscilation incoming notes
- DrunkRate (x, y) // oscilation rate
- SPDDrunk (x, y) // wiggle speed
- SpeedMulti (y) // Speed controller (like 'Change Scroll Speed' event)
- Invert(O/P)(1 to 4) - (y) // changes to Downscroll and Upscroll
- Ease (x = Out, y = In, angle = toggle movement) // like Easing Tween
- RandomSPD (x-min, y-max)
- SawThoot //  self Explained
- SawToothRate
- SineTooth // same as drunk but there's no direction variation 
- SineToothRate

Modifiers for Strums:
---
- Expand (x, y) // expand notes from middle or invert their position :v
- Swap (x) // invert strums position
- AngleStrum(O/P) (angle) // change strums angle
- Bulge(O/P) (y) // bulges the strum
- Scale(O/P) (x, y, angle = Both) // change note size
- Tipsy(O/P) (x, y) // oscilation in strum
- SPDTipsy (x, y) // speed strum oscilation
- TipRemaping (x, y) // expand or compress the oscilation
- Cross(O/P) (x, y) // cross notes
- Radius(O/P) (x) // move the notes in default direction (looks better with 'Expand' at 0)
- Beating(O/P) (x, y) // move the notes at the music rythm
- Spin(O/P) (x, angle) // Spin Strums :V
- Shake(O/P) ()

Modifiers working in Z :
---
- Bulge (angle)
- Expand (angle)
- Tipsy and components (angle)
- Cross (angle)

Strum and Notes controllers:
---
- OpStrum (x, y, angle = direction, alpha)
- PlStrum (x, y, angle = direction, alpha)

- OPnote(1 to 4) - (x, y, angle)
- PLnote(1 to 4) - (x, y, angle)

- OnotScale(1 to 4) - (x, y, angle = Both) // size notes change Opponent
- PnotScale(1 to 4) - (x, y, angle = Both) // size notes change Player

- OpStrumZ (x) // tween in Z
- PlStrumZ (x) // tween in Z

- dirO(1 to 4) - (angle) // individual direction change Opponent
- dirP(1 to 4) - (angle) // individual direction change Player

Shaders :
---
- Wave (x, y) -- WaveSPD -- WaveRate
- AngleCam (Curve Shader - TheLeerName // TYSM bro) (x, y)
- Vignette (x/size, y/intensity)
- Chromatic (x)
- Flares (x)
- Contrast (x)
- FilmGrain (x)
- ToneMap (x)
- Glitch (x)
- GB (gameboy) (x)
- Saturation (x)
- HUE (x)
- SplitScreen (x, y) (like Geometry Dash's Shader)
- Pinch (x)
- BulgeSc (x)
- camPro (x, y, angle) -- camProZoom (x) // Capcut Camera xd
- Brightness (x)
- Cinematic(HUD/game) (x, y)

Helpers :
---
- isPixelnote (x) // set manually to 5.5 if your notes are Pixel
- SustainAlpha // change Sustain opacity
- LockAng(O/P) (x) // lock angle noteStrums in camHUD
- DirOnSpin(O/P) (ang) // change Direction when Strum Spins
- AngOnSpin(O/P) (x) // the same, but with noteStrums angle
- fZ (x) // 1 for sin, 2 for cos
- InvCross // self Explained

Example :
---
if u wanna do tween effect then type this
- doTween(X, Y, etc)('tag', 'modifierName', intensity, time, 'ease') // same with other Tweens

if u wanna a instead activation then do this
- setProperty('(modifiername).(x, y, etc)', intensity)


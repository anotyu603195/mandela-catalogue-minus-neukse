local nogf = true
local followchars = true;
local del = 0;
local del2 = 0;
local xx = 160;
local yy = 817;
local xx2 = 160;
local yy2 = 817;
local ofs = 20;

function onCreate()
	-- background shit
    makeLuaSprite('bars', 'bedroom/bars', -480, 440);
    setLuaSpriteScrollFactor('bars', 0.95, 0.95);

	makeLuaSprite('room', 'bedroom/room', -500, 440);
    setLuaSpriteScrollFactor('room', 1, 1);
    scaleObject('room', 1, 1) 

    setPropertyFromClass('GameOverSubstate', 'characterName', 'MarkDeath'); --Character json file for the death animation
    setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'gunshot');

    if not lowQuality then

    end

    addLuaSprite('room', false);
    addLuaSprite('bars', true);

end

function onStepHit()
    if curStep == 1 then
		for i = 0,7 do
			xValue = getPropertyFromGroup('strumLineNotes', i, 'x')
			if i < 3.5 then
				setPropertyFromGroup('strumLineNotes', i, 'x', xValue+640)
			else
				setPropertyFromGroup('strumLineNotes', i, 'x', xValue-640)
			end
		end
	end

    --gunshots lol
    if curStep == 785 or curStep == 817 or curStep == 849 or curStep == 870 or curStep == 879 or curStep == 883 or curStep == 885 or curStep == 888 or curStep == 890 or curStep == 892 or curStep == 894 or curStep == 3089 or curStep == 3121 or curStep == 3153 or curStep == 3171 or curStep == 3183 or curStep == 3187 or curStep == 3192 or curStep == 3194 or curStep == 3196 or curStep == 3198 or curStep == 3200 then
        playSound('gunshot', 0.9);
        characterPlayAnim('boyfriend', 'shoot', true);
		characterPlayAnim('dad', 'dodge', true);
    end
end

function onGameOverStart()
    makeLuaSprite('red', 'bedroom/red', 10, 40);
    addLuaSprite('red', true);
    doTweenAlpha('red', 'red', 0, 1.2, 'linear');
end

function onUpdate(elapsed)

    for i=0,3 do
        noteTweenAlpha(i+0, i, math.floor, 0.3)
    end

    if nogf == true then
        setProperty('gf.alpha', 0)
    end
    if alpha == true then
        for i = 0,7 do
            setPropertyFromGroup('strumLineNotes', i, 'alpha', 0)
        end
    end

    if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
    if followchars == true then
        if mustHitSection == false then
            setProperty('defaultCamZoom', 1.1)
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
        else

            setProperty('defaultCamZoom',1.1)
            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
    else
        triggerEvent('Camera Follow Pos','','')
    end
end
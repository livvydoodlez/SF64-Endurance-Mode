--Change this to 1 if you aren't use to score running
local DIFFICULTY_MODE = 1



local gms = 0
local gss = 0
local gmm = 0
local mm = 0
local ss = 0
local ms = 0
local timeTick = 0
local comparems = 0
local comparess = 0
local comparemm = 0
local killPlayer = 0
local stoptimer = 0
local playerLives = 0
local playerStage = 0
local playerState1 = 0
local playerState2 = 0
local playerMode = 0
local mapStatus = 0
local mainMenu = 0
local systemBoot = 0
local playerScore = 0
local currentScore = 0
local currentBombs = 0
local playerBombs = 0
local ims = 0
local count = 0
local playerMenu = 0
local playerHealth1 = 0
local playerHealth2 = 0
local playerRWing1 = 0
local playerRWing2 = 0
local falco = 0
local slippy = 0
local peppy = 0
local currentHealth = 0
local currentRWing = 0
local currentLWing = 0
local healthFlag = 0
local laserStatus = 0
local lifeTime = 0
local lifeTicked = 0
local fDead = 0
local sDead = 0
local pDead = 0
local fTicked = 0
local sTicked = 0
local pTicked = 0
local playerLives = 0
local currentLives = 0
local bonus = 0
local attackBonus = 0

--Stage IDs
local pCor = 0
local pMet = 1
local pSeX = 2
local pAr6 = 3
local pSeY = 5
local pVe1 = 6
local pSol = 7
local pZon = 8
local pV1T = 9
local pTra = 10
local pMac = 11
local pTit = 12
local pAqu = 13
local pFor = 14
local pKat = 16
local pBol = 17
local pSeZ = 18
local pVe2 = 19

local sTine = 10
local sTimeM = 0


function getInfo()
    playerLives = tonumber(memory.readbyte(0x157911, "RDRAM"))
    playerStage = tonumber(memory.readbyte(0x16E0A7, "RDRAM"))
    playerState1 = tonumber(memory.readbyte(0x137BAB, "RDRAM"))
    playerState2 = tonumber(memory.readbyte(0x13AA8B, "RDRAM"))
    playerMode = tonumber(memory.read_s32_be(0x16D868, "RDRAM"))
    mapStatus = tonumber(memory.read_s32_be(0x1C37B4, "RDRAM"))
    mainMenu = tonumber(memory.read_s32_be(0x16D6A4, "RDRAM"))
    systemBoot = tonumber(memory.read_s32_be(0x16DC20, "RDRAM"))
    playerScore = tonumber(memory.readbyte(0x15759F, "RDRAM"))
    playerBombs = tonumber(memory.readbyte(0x16DC13, "RDRAM"))
    playerMenu = tonumber(memory.read_s32_be(0x157680, "RDRAM"))
    playerHealth1 = tonumber(memory.read_s16_be(0x137C46, "RDRAM"))
    playerHealth2 = tonumber(memory.read_s16_be(0x13AB26, "RDRAM"))
    playerRWing1 = tonumber(memory.readbyte(0x137E7C,  "RDRAM"))
    playerRWing2 = tonumber(memory.readbyte(0x13AD5C, "RDRAM"))
    playerLWing1 = tonumber(memory.readbyte(0x137E7D,  "RDRAM"))
    playerLWing2 = tonumber(memory.readbyte(0x13AD5D, "RDRAM"))
    falco = tonumber(memory.readbyte(0x16D724, "RDRAM"))
    slippy = tonumber(memory.readbyte(0x16D728, "RDRAM"))
    peppy = tonumber(memory.readbyte(0x16D72C, "RDRAM"))
    laserStatus = tonumber(memory.readbyte(0x15791B, "RDRAM"))
    playerLives = tonumber(memory.readbyte(0x157911, "RDRAM"))
    if DIFFICULTY_MODE == 0 then
        bonus = 30
        attackBonus = 1
    end
end

function injectScore()
    --gui.text(0,0,"Current Score: " ..tostring(playerScore))
    ims = ims + 0.05
    if ims >= 1 then
        ims = 0
        currentScore = playerScore - currentScore
        ss = ss + currentScore
    end
end

function startTimes()
    if laserStatus == 0 then
        --STAGES PER LEVEL--
        if playerStage == pCor then
            sTimeM = 0
            sTime = 10
        elseif playerStage == pMet then
            sTimeM = 1
            sTime = 50
        elseif playerStage == pFor then
            sTimeM = 0
            sTime = 15
        elseif playerStage == pSeY then
            sTimeM = 1
            sTime = 50
        elseif playerStage == pKat then
            sTimeM = 0
            sTime = 10
        elseif playerStage == pSeX then
            sTimeM = 1
            sTime = 10
        elseif playerStage == pSol then
            sTimeM = 5
            sTime = 0
        elseif playerStage == pAqu then
            sTimeM = 2
            sTime = 0
        elseif playerStage == pZon then
            sTimeM = 0
            sTime = 10
        elseif playerStage == pMac then
            sTimeM = 0
            sTime = 20
        elseif playerStage == pSeZ then
            sTimeM = 2
            sTime = 0
        elseif playerStage == pAr6 then
            sTimeM = 0
            sTime = 20
        elseif playerStage == pBol then
            sTimeM = 0
            sTime = 15
        elseif playerStage == pTit then
            sTimeM = 0
            sTime = 20
        elseif playerStage == pVe1 then
            sTimeM = 0
            sTime = 10
        elseif playerStage == pVe2 then
            sTimeM = 0
            sTime = 40
        else
            sTimeM = 0
            sTime = 15
        end
    elseif laserStatus == 1 then
        if playerStage == pCor then
            sTimeM = 0
            sTime = 12
        elseif playerStage == pMet then
            sTimeM = 1
            sTime = 52
        elseif playerStage == pFor then
            sTimeM = 0
            sTime = 17
        elseif playerStage == pSey then
            sTimeM = 1
            sTime = 52
        elseif playerStage == pKat then
            sTimeM = 0
            sTime = 12
        elseif playerStage == pSeX then
            sTimeM = 1
            sTime = 12
        elseif playerStage == pSol then
            sTimeM = 5
            sTime = 10
        elseif playerStage == pAqu then
            sTimeM = 2
            sTime = 5
        elseif playerStage == pZon then
            sTimeM = 0
            sTime = 12
        elseif playerStage == pMac then
            sTimeM = 0
            sTime = 25
        elseif playerStage == pSeZ then
            sTimeM = 2
            sTime = 5
        elseif playerStage == pAr6 then
            sTimeM = 0
            sTime = 22
        elseif playerStage == pBol then
            sTimeM = 0
            sTime = 17
        elseif playerStage == pTit then
            sTimeM = 0
            sTime = 25
        elseif playerStage == pVe1 then
            sTimeM = 0
            sTime = 12
        elseif playerStage == pVe2 then
            sTimeM = 0
            sTime = 45
        else
             sTimeM = 0
             sTime = 17
        end
    else
        if playerStage == pCor then
            sTimeM = 0
            sTime = 15
        elseif playerStage == pMet then
            sTimeM = 1
            sTime = 55 
        elseif playerStage == pFor then
            sTimeM = 0
            sTime = 20
        elseif playerStage == pSey then
            sTimeM = 1
            sTime = 55
        elseif playerStage == pKat then
            sTimeM = 0
            sTime = 15
        elseif playerStage == pSeX then
            sTimeM = 1
            sTime = 15
        elseif playerStage == pSol then
            sTimeM = 5
            sTime = 20
        elseif playerStage == pAqu then
            sTimeM = 2
            sTime = 10
        elseif playerStage == pZon then
            sTimeM = 0
            sTime = 15
        elseif playerStage == pMac then
            sTimeM = 0
            sTime = 30
        elseif playerStage == pSeZ then
            sTimeM = 2
            sTime = 10
        elseif playerStage == pAr6 then
            sTimeM = 0
            sTime = 24
        elseif playerStage == pBol then
            sTimeM = 0
            sTime = 20
        elseif playerStage == pTit then
            sTimeM = 0
            sTime = 30
        elseif playerStage == pVe1 then
            sTimeM = 0
            sTime = 15
        elseif playerStage == pVe2 then
            sTimeM = 0
            sTime = 50
        else
            sTimeM = 0
            sTime = 20
        end
    end
end


function removeCheckpoints()
    memory.write_s16_be(0x05E588, 3075, "RDRAM")
    memory.write_s16_be(0x05E58A, 276, "RDRAM")
    memory.write_s16_be(0x0C0450, 9220, "RDRAM")
    memory.write_s16_be(0x0C0452, 323, "RDRAM")
    memory.write_s16_be(0x0C0454, 34306, "RDRAM")
    memory.write_s16_be(0x0C0456, 16, "RDRAM")
    memory.write_s16_be(0x0C0458, 5250, "RDRAM")
    memory.write_s16_be(0x0C045A, 2, "RDRAM")
    memory.write_s16_be(0x0C045C, 9220, "RDRAM")
    memory.write_s16_be(0x0C045E, 324, "RDRAM")
    memory.write_s16_be(0x0C0460, 42500, "RDRAM")
    memory.write_s16_be(0x0C0462, 16, "RDRAM")
    memory.write_s16_be(0x0C0464, 992, "RDRAM")
    memory.write_s16_be(0x0C0466, 8, "RDRAM")
    memory.write_s16_be(0x0C0468, 34306, "RDRAM")
    memory.write_s16_be(0x0C046A, 16, "RDRAM")
    --[[3075
    276
    9220
    323
    34306
    16
    5250
    2
    9220
    324
    42500
    16
    992
    8
    34306
    16]]--
end

function lifeTick()
    if lifeTicked == 1 then
        lifeTime = lifeTime + 1
        if lifeTime >= 10 then
            lifeTime = 0
            lifeTicked = 0
            subtractTime1()
        end
    end
end

function teamDead()
    if falco == 255 then
        if fTicked == 0 then
            fDead = 1
        end
    end
    if slippy == 255 then
        if sTicked == 0 then
            sDead = 1
        end
    end
    if peppy == 255 then
        if pTicked == 0 then
            pDead = 1
        end
    end
end
    

function reset()
    gms = 0
    gss = 0
    gmm = 0
end

function timer()
    if playerMenu == 1 then
        gms = gms
        gss = gss
        gmm = gmm
    else
        if laserStatus == 0 then
            gms = gms + 0.015
        elseif laserStatus == 1 then
            gms = gms + 0.030
        else
            gms = gms + 0.045
        end
        if gms >= 1 then
            gms = 0
            gss = gss + 1
        end
        if gss == 60 then
            gss = 0
            gmm = gmm + 1
        end
        if gmm == 60 then
            gmm = 0
        end
    end
end

function countdown()
    ms = 0
    mm = sTimeM
    ss = sTime + bonus
end


function fixtime()
    if comparemm >= 60 then
        mm = mm - 60
        gmm = 0
    end
    if comparess >= 60 then
        ss = ss - 60
        mm = mm + 1
        gss = 0
    end
    if comparems > 0.999 then
        ms = ms - 0.999
        ss = ss + 1
        gms = 0
    end
    --[[if comparess < 0 and comparems >= 1 then
        ss = 60 - ss
        gss = 0
    end]]--
    --[[if comparems < 0 and comparess >= 1 then
        ms = 0.999 - ms
        gms = 0
    end]]--
end
    
    
function compare()
    if playerMenu == 1 then
        gui.pixelText(140, 30, "- PAUSED -", 0xFFFF0000)
    else
        comparemm = mm - gmm
        comparess = ss - gss
        comparems = gms - ms
        if comparemm <= 0 and comparess <= 0 and comparems <= 0 then
            stoptimer = 1
            killPlayer = 1
        end
        if comparemm < 0 then
            comparemm = 0
        end
        if comparess < 0 and comparemm >= 1 then
            ss = 59
            if mm == 1 then
                mm = 0
            else
                mm = mm - 1
            end
            gss = 0
        end
    end
end

function addTime()
    if laserStatus == 0 then
        ss = ss + 1 + attackBonus
    elseif laserStatus == 1 then
        ss = ss + 1.5 + attackBonus
    else
        ss = ss + 2 + attackBonus
    end
    count = count + 1
    --gui.text(0,50,"Added time.")
end

function subtractTime()
    if laserStatus == 0 then
        ss = ss - 5 + attackBonus
    elseif laserStatus == 1 then
        ss = ss - 10 + attackBonus
    else
        ss = ss - 15 + attackBonus
    end
    --gui.text(0,50,"Subtract time.")
end  

function subtractTime1()
    ss = ss - 1 + attackBonus
    --gui.text(0,50,"Subtract time.")
end

function subtractTime2()
    ss = ss - 10 + attackBonus
    --gui.text(0,50,"Subtract time.")
end


while true do
    fixtime()
    getInfo()
    --gui.text(0,0,"Time Ticked? " ..tostring(timeTick))
    if playerState1 == 3 or playerState2 == 3 or playerState1 == 9 or playerState2 == 9 or playerState1 == 8 or playerState2 == 8 then
        lifeTick()
        teamDead()
        removeCheckpoints()
        if healthFlag == 0 then
            healthFlag = 1
            if playerState1 == 3 then
                currentHealth = playerHealth1
                currentLives = playerLives
            end
            if playerState2 == 3 then
                currentHealth = playerHealth2
                currentLives = playerLives
            end
        end
        if timeTick == 0 then
            timeTick = 1
            startTimes()
            countdown()
            reset()
        end
        if timeTick == 1 then
            timer()
            compare()
            --injectScore()
        end
        if currentLives > playerLives then
            currentScore = 0
            currentLives = playerLives
        end
        if currentHealth > playerHealth1 and playerState1 == 3 then
            currentHealth = playerHealth1
            lifeTicked = 1
        end
        if currentHealth > playerHealth2 and playerState2 == 3 then
            currentHealth = playerHealth2
            lifeTicked = 1
        end
        if currentScore < playerScore then
            addTime()
            currentScore = playerScore
        end
        if currentBombs > playerBombs then
            subtractTime()
            currentBombs = playerBombs
        end
        if currentBombs < playerBombs then
            currentBombs = playerBombs
        end
        if fDead == 1 and fTicked == 0 then
            subtractTime2()
            fTicked = 1
        end
        if sDead == 1 and sTicked == 0 then
            subtractTime2()
            sTicked = 1
        end
        if pDead == 1 and pTIcked == 0 then
            subtractTime2()
            pTicked = 1
        end
    else
        healthFlag = 0
        timeTick = 0
        stoptimer = 0
    end
    if stoptimer == 1 then
        comparemm = 0
        comparess = 0
        comparems = 0
    end
    if comparemm >= 1 then
        gui.pixelText(220,8,"Time Left: " .. tostring(comparemm) .. ":" .. tostring(comparess) .. ":" .. tostring(comparems), 0xFF00FF00, 0xFF000000)
    elseif comparemm <= 0 and comparess >= 15 then
        gui.pixelText(220,8,"Time Left: " .. tostring(comparemm) .. ":" .. tostring(comparess) .. ":" .. tostring(comparems), 0xFFFFFF00, 0xFF000000)
    else
        gui.pixelText(220,8,"Time Left: " .. tostring(comparemm) .. ":" .. tostring(comparess) .. ":" .. tostring(comparems), 0xFFFF0000, 0xFF000000)
    end
    --gui.text(0,0,"M: " ..tostring(gmm) .. " S:" .. tostring(gss) .. " gms:" .. tostring(gms))
    if killPlayer == 1 then
        --gui.text(0,40,"Kill player")
        if playerState1 == 3 then
            playerState1 = tonumber(memory.writebyte(0x137BAB, 4, "RDRAM"))
        end
        if playerState2 == 3 then
            playerState2 = tonumber(memory.writebyte(0x13AA8B, 4, "RDRAM"))
        end
        startTimes()
        countdown()
        reset()
        timer()
        compare()
        killPlayer = 0
        timeTick = 0
        currentHealth = 255
        currentScore = 0
    end
    if playerState1 == 4 or playerState2 == 4 or playerState1 == 6 or playerState2 == 6 then
        startTimes()
        countdown()
        reset()
        timer()
        compare()
        killPlayer = 0
        timeTick = 0
        currentHealth = 255
        currentScore = 0
    end
    --[[ DEBUG TEXT
    
    gui.text(0,0,"Player Score: " .. tostring(playerScore))
    gui.text(0,20,"MS: " ..tostring(ms))
    gui.text(0,40,"ATC: " ..tostring(count))
    gui.text(0,60,"Falco: " ..tostring(falco))
    gui.text(0,80,"Slippy: " ..tostring(slippy))
    gui.text(0,100,"Peppy: " ..tostring(peppy))
    gui.text(0,120,"Current Health: " .. tostring(currentHealth))
    gui.text(0,140,"Health1: " ..tostring(playerHealth1))
    gui.text(0,160,"Health2: " ..tostring(playerHealth2))
    gui.text(0,180,"RWing1: " ..tostring(playerRWing1))
    gui.text(0,200,"RWing2: " ..tostring(PlayerRWing2))
    gui.text(0,220,"Life Tickeed?: " ..tostring(lifeTicked))
    gui.text(0,240,"Life Tick Time: " ..tostring(lifeTime))
    gui.text(0,260,"Falco status: " ..tostring(falco))
    gui.text(0,280,"Slippy stauts: " .. tostring(slippy))
    gui.text(0,300,"Peppy stauts: " .. tostring(peppy))
    gui.text(0,320,"Timer Ticked?: " ..tostring(timeTick))
    gui.text(0,340,"Current Score: " ..tostring(currentScore))
    
    ]]--
    emu.frameadvance()
end


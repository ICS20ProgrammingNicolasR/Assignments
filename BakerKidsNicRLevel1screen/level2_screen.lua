-----------------------------------------------------------------------------------------
--
-- level2_screen.lua
-- Created by: Your Name
-- Date: Month Day, Year
-- Description: This is the level 1 screen of the game.
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
-- INITIALIZATIONS
-----------------------------------------------------------------------------------------

-- Use Composer Libraries
local composer = require( "composer" )
local widget = require( "widget" )

-----------------------------------------------------------------------------------------

-- Naming Scene
sceneName = "level2_screen"

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

-- The local variables for this scene
local bkg
local BakingPowder1
local BakingPowder1TextField
local BakingPowder2
local BakingPowder2TextField
local BakingSoda1
local BakingSoda1TextField
local BakingSoda2
local BakingSoda2TextField
local Butter
local ButterTextField
local Eggs1
local Eggs1TextField
local Eggs2
local Flour 
local FlourTextField
local Milk
local MilkTextField
local Salt
local SaltTextField
local Sugar
local SugarTextField
local bakingpowdertimer
local BakingSodaTimer
local ButterTimer
local EggsTimer
local MilkTimer
local SaltTimer
local SugarTimer
local ANSWERBAKINGPOWDER1 = "g"
local ANSWERBAKINGPOWDER2 = "r"
local ANSWERBAKINGSODA1 = "g"
local ANSWERBAKINGSODA2 = "a"
local ANSWERBUTTER = "r"
local ANSWEREGGS = "g"
local ANSWERFLOUR = "r"
local ANSWERMILK = "k"
local ANSWERSALT = "t"
local ANSWERSUGAR = "r"
local userAnswerBakingPowder1
local userAnswerBakingPowder2
local userAnswerBakingSoda1
local userAnswerBakingSoda2
local userAnswerButter
local userAnswerEggs
local userAnswerFlour
local userAnswerMilk
local userAnswerSalt
local userAnswerSugar
local totalseconds = 60
local lives = 3
local secondsleft = 60
local BakingSodaV = false
local ButterV = false
local EggsV = false
local FlourV = false
local MilkV = false
local SaltV = false
local SugarV = true
-----------------------------------------------------------------------------------------
-- SOUNDS
-----------------------------------------------------------------------------------------
level1Sound = audio.loadSound("Sounds/level1screenmusic.mp3")
level1SoundChannel = audio.play(level1Sound,{loops = -1})
local correctSound = audio.loadSound("Sounds/correctsound.wav")
local correctSoundChannel
local incorrectSound = audio.loadSound("Sounds/incorrectsound.wav")
local incorrectSoundChannel
-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------
function restartscene(  )
    if (BakingPowder1 ~= nil)then
        BakingPowder1.x = 50
        BakingPowder1.y = 110
        BakingPowder1.width = 30
        BakingPowder1TextField.x = 105
        BakingPowder1TextField.y = 110
        BakingPowder1TextField:scale(1,1)
        BakingPowder2.x = 180
        BakingPowder2.y = 110
        BakingPowder2:scale(1,1)
        BakingPowder2TextField.x = 400
        BakingPowder2TextField.y = 110
        BakingPowder2TextField:scale(1,1)
        BakingSoda1.x = 340
        BakingSoda1.y = 110
        BakingSoda1:scale(1,1)
        BakingSoda1TextField.x = 400
        BakingSoda1TextField.y = 110
        BakingSoda1TextField:scale(1,1)
        BakingSoda2.x = 450
        BakingSoda2.y = 110
        BakingSoda2:scale(1,1)
        BakingSoda2TextField.x = 500
        BakingSoda2TextField.y = 110
        BakingSoda2TextField:scale(1,1)
        Butter.x = 580
        Butter.y = 110
        Butter:scale(1,1)
        ButterTextField.x = 635
        ButterTextField.y = 110
        ButterTextField:scale(1,1)
        Eggs1.x = 680
        Eggs1.y = 110
        Eggs1:scale(1,1)
        Eggs1TextField.x = 720
        Eggs1TextField.y = 110
        Eggs1TextField:scale(1,1)
        Eggs2.x = 750
        Eggs2.y = 110
        Eggs2:scale(1,1)
        Flour.x = 850
        Flour.y = 110
        Flour:scale(1,1)
        FlourTextField.x = 850
        FlourTextField.y = 110
        FlourTextField:scale(1,1)
        Milk.x = 900
        Milk.y = 110
        Milk:scale(1,1)
        MilkTextField.x = 940
        MilkTextField.y = 110
        MilkTextField:scale(1,1)
        Salt.x = 30
        Salt.y = 150
        Salt:scale(1,1)
        SaltTextField.x = 80
        SaltTextField.y = 150
        SaltTextField:scale(1,1)
        Sugar.x = 140
        Sugar.y = 150
        Sugar:scale(1,1)
        SugarTextField.x = 200
        SugarTextField.y = 150
        SugarTextField:scale(1,1)
        BakingPowder1.isVisible = true
        BakingPowder2.isVisible = true
        BakingSoda1.isVisible = true
        BakingSoda2.isVisible = true
        Butter.isVisible = true
        Eggs1.isVisible = true
        Eggs2.isVisible = true
        Flour.isVisible = true
        Milk.isVisible = true
        Salt.isVisible = true
        Sugar.isVisible = true
        BakingPowder1TextField.isVisible = true
        BakingPowder2TextField.isVisible = true
        BakingSoda1TextField.isVisible = true
        BakingSoda2TextField.isVisible = true
        ButterTextField.isVisible = true
        Eggs1TextField.isVisible = true
        FlourTextField.isVisible = true
        MilkTextField.isVisible = true
        SaltTextField.isVisible = true
        SugarTextField.isVisible = true
        pauseButton.isVisible = true
        StartTimer()
    end
end
local function LoseScreenTransition( )        
    composer.gotoScene( "YouLose", {effect = "slideRight", time = 1000})
end 
local function WinScreenTransition( )        
    composer.gotoScene( "YouWin", {effect = "slideRight", time = 1000})
end 
local function pause(  )
    timer.pause(countDownTimer)
    composer.showOverlay( "PauseScreen", { isModal = true, effect = "fade", time = 100})
    BakingPowder1.isVisible = false
    BakingPowder2.isVisible = false
    BakingSoda1.isVisible = false
    BakingSoda2.isVisible = false
    Butter.isVisible = false
    Eggs1.isVisible = false
    Eggs2.isVisible = false
    Flour.isVisible = false
    Milk.isVisible = false
    Salt.isVisible = false
    Sugar.isVisible = false
    BakingPowder1TextField.isVisible = false
    BakingPowder2TextField.isVisible = false
    BakingSoda1TextField.isVisible = false
    BakingSoda2TextField.isVisible = false
    ButterTextField.isVisible = false
    Eggs1TextField.isVisible = false
    FlourTextField.isVisible = false
    MilkTextField.isVisible = false
    SaltTextField.isVisible = false
    SugarTextField.isVisible = false
    pauseButton.isVisible = false
end
function resumeGamelevel2(  )
    timer.resume(countDownTimer)
    BakingPowder1.isVisible = true
    BakingPowder2.isVisible = true
    BakingSoda1.isVisible = true
    BakingSoda2.isVisible = true
    Butter.isVisible = true
    Eggs1.isVisible = true
    Eggs2.isVisible = true
    Flour.isVisible = true
    Milk.isVisible = true
    Salt.isVisible = true
    Sugar.isVisible = true
    BakingPowder1TextField.isVisible = true
    BakingPowder2TextField.isVisible = true
    BakingSoda1TextField.isVisible = true
    BakingSoda2TextField.isVisible = true
    ButterTextField.isVisible = true
    Eggs1TextField.isVisible = true
    FlourTextField.isVisible = true
    MilkTextField.isVisible = true
    SaltTextField.isVisible = true
    SugarTextField.isVisible = true
    pauseButton.isVisible = true
end
local function BakingPowder( event )       
    BakingPowder1.x=BakingPowder1.x+3
    BakingPowder1.y = BakingPowder1.y+2.5
    BakingPowder1:scale(1.002,1.002)
    BakingPowder1TextField.x = BakingPowder1TextField.x + 3.15
    BakingPowder1TextField.y = BakingPowder1TextField.y + 2.5
    BakingPowder1TextField:scale(1.002,1.002)
    BakingPowder2.x=BakingPowder2.x+3.27
    BakingPowder2.y = BakingPowder2.y + 2.5
    BakingPowder2:scale(1.002,1.002)
    BakingPowder2TextField.x = BakingPowder2TextField.x + 3.4
    BakingPowder2TextField.y = BakingPowder2TextField.y + 2.5
    BakingPowder2TextField:scale(1.002,1.002)
    if (BakingPowder1.x >= display.contentCenterX) then
       BakingPowder1TextField:resizeFontToFitHeight()
       BakingPowder2TextField:resizeFontToFitHeight()
       timer.cancel(bakingpowdertimer)       
    else
        bakingpowdertimer = timer.performWithDelay(-0.1,BakingPowder)  
    end
end

local function BakingSoda( event )
    BakingSoda1.x = BakingSoda1.x+3
    BakingSoda1.y = BakingSoda1.y+3
    BakingSoda1:scale(1.002,1.002)
    BakingSoda1TextField.x = BakingSoda1TextField.x +3.06
    BakingSoda1TextField.y = BakingSoda1TextField.y + 3
    BakingSoda2.x = BakingSoda2.x+3.1
    BakingSoda2.y = BakingSoda2.y + 3
    BakingSoda2:scale(1.002,1.002)
    BakingSoda2TextField.x = BakingSoda2TextField.x + 3.15
    BakingSoda2TextField.y = BakingSoda2TextField.y + 3
    BakingSoda2TextField:scale(1.0015,1.0015)
    BakingSoda1TextField:scale(1.0015,1.0015)
    if (BakingSoda1.x >= display.contentCenterX)then
        BakingSoda1TextField:resizeFontToFitHeight()
        BakingSoda2TextField:resizeFontToFitHeight()
        timer.cancel(BakingSodaTimer)
    else
        BakingSodaTimer = timer.performWithDelay(-0.01, BakingSoda)         end
end
local function Butter1( touch )
    if (ButterV == true)then
        Butter:removeEventListener("touch", Butter1)
        Butter.x=Butter.x-1
        Butter.y = Butter.y + 2
        Butter:scale(1.005,1.005)
        ButterTextField.x = ButterTextField.x - 0.5
        ButterTextField.y = ButterTextField.y + 2
        ButterTextField:scale(1.005,1.005)
        if(Butter.x == display.contentCenterX)then
            timer.cancel(ButterTimer)
            ButterTextField:resizeFontToFitHeight() 
        else
            ButterTimer = timer.performWithDelay(-0.1, Butter1)
        end
    end
end
local function Eggs( touch )
    if (EggsV == true) then
        Eggs1:removeEventListener("touch", Eggs)
        Eggs2:removeEventListener("touch", Eggs)
        Eggs1.x=Eggs1.x-1
        Eggs1.y = Eggs1.y+1
        Eggs1:scale(1.002,1.002)
        Eggs1TextField.x = Eggs1TextField.x - 0.9
        Eggs1TextField.y = Eggs1TextField.y +1
        Eggs1TextField:scale(1.002,1.002)
        Eggs2.x = Eggs2.x-0.9
        Eggs2.y = Eggs2.y + 1
        Eggs2:scale(1.002,1.002)
        if(Eggs1.x == display.contentCenterX)then
            timer.cancel(EggsTimer)
            Eggs1TextField:resizeFontToFitHeight()
        else
            EggsTimer = timer.performWithDelay(-0.3,Eggs)
        end
    end
end
local function Flour1( touch )
    if (FlourV == true)then
        Flour:removeEventListener("touch", Flour1)
        Flour.x=Flour.x-3
        Flour.y = Flour.y + 2
        Flour:scale(1.0015,1.0015)
        FlourTextField.x = FlourTextField.x-2.9
        FlourTextField.y = FlourTextField.y + 2
        FlourTextField:scale(1.0015,1.0015)
        if(Flour.x == display.contentCenterX)then
            timer.cancel(FlourTimer)
            FlourTextField:resizeFontToFitHeight()

        else
            FlourTimer = timer.performWithDelay(-0.1,Flour1)
        end
    end

end
local function Milk1( touch )
    if (MilkV == true) then
        Milk:removeEventListener("touch", Milk1)
        Milk.x=Milk.x-2
        Milk.y = Milk.y + 2
        Milk:scale(1.0015,1.0015)
        MilkTextField.x = MilkTextField.x - 1.95
        MilkTextField.y = MilkTextField.y + 2
        MilkTextField:scale(1.0015,1.0015)
        if(Milk.x == display.contentCenterX)then
            timer.cancel(MilkTimer)
            MilkTextField:resizeFontToFitHeight()
        else
            MilkTimer = timer.performWithDelay(-0.23, Milk1)
        end
    end
end
local function Salt1( touch )
    if (SaltV == true)then
        Salt:removeEventListener("touch", Salt1)
        Salt.x=Salt.x+2
        Salt.y = Salt.y + 1.5
        Salt:scale(1.0015,1.0015)
        SaltTextField.x = SaltTextField.x + 2.05
        SaltTextField.y = SaltTextField.y + 1.5
        SaltTextField:scale(1.0015,1.0015)
        if(Salt.x == display.contentCenterX)then
            timer.cancel(SaltTimer)
            SaltTextField:resizeFontToFitHeight()
        else
            SaltTimer = timer.performWithDelay(-0.3, Salt1)
        end
    end
end
local function Sugar1( touch )
    if (SugarV == true) then
        Sugar:removeEventListener("touch", Sugar1)
        Sugar.x=Sugar.x+2
        Sugar.y = Sugar.y+2
        Sugar:scale(1.0015,1.0015)
        SugarTextField.x = SugarTextField.x+2.1
        SugarTextField.y = SugarTextField.y + 2
        SugarTextField:scale(1.0015,1.0015)
        if(Sugar.x == display.contentCenterX)then
            timer.cancel(SugarTimer)
            SugarTextField:resizeFontToFitHeight()
        else
            SugarTimer = timer.performWithDelay(-0.3, Sugar1)
        end
    end
end
local function incorrectcorrectObjectinvisible(  )
    -- hide the correct and incorrect objects
    incorrectTextObject.isVisible = false
    correctObject.isVisible = false
end
local function DissapearBakingPowder( event )
    BakingPowder1.text = "Baking   Powder"      
    BakingPowder1.x=BakingPowder1.x+3
    BakingPowder1.y = BakingPowder1.y+2.5
    BakingPowder1:scale(1.002,1.002)
    BakingPowder1TextField.x = BakingPowder1TextField.x + 3.15
    BakingPowder1TextField.y = BakingPowder1TextField.y + 2.5
    BakingPowder1TextField:scale(1.002,1.002)
    BakingPowder2.x=BakingPowder2.x+3.27
    BakingPowder2.y = BakingPowder2.y + 2.5
    BakingPowder2:scale(1.002,1.002)
    BakingPowder2TextField.x = BakingPowder2TextField.x + 3.4
    BakingPowder2TextField.y = BakingPowder2TextField.y + 2.5
    BakingPowder2TextField:scale(1.002,1.002)
    BakingPowder1.alpha = BakingPowder1.alpha - 0.1
    BakingPowder2.isVisible = false
    BakingPowder1TextField.isVisible = false
    BakingPowder2TextField.isVisible = false
    bakingpowdertimer = timer.performWithDelay(100,DissapearBakingPowder)
end

local function DissapearBakingSoda( event )
    BakingSoda1.text = "Baking    Soda"
    BakingSoda1.x = BakingSoda1.x+3
    BakingSoda1.y = BakingSoda1.y+3
    BakingSoda1:scale(1.002,1.002)
    BakingSoda1TextField.x = BakingSoda1TextField.x +3.06
    BakingSoda1TextField.y = BakingSoda1TextField.y + 3
    BakingSoda2.x = BakingSoda2.x+3.1
    BakingSoda2.y = BakingSoda2.y + 3
    BakingSoda2:scale(1.002,1.002)
    BakingSoda2TextField.x = BakingSoda2TextField.x + 3.15
    BakingSoda2TextField.y = BakingSoda2TextField.y + 3
    BakingSoda2TextField:scale(1.0015,1.0015)
    BakingSoda1TextField:scale(1.0015,1.0015)
    BakingSoda1.alpha = BakingSoda1.alpha - 0.01
    BakingSoda2.isVisible = false
    BakingSoda1TextField.isVisible = false
    BakingSoda2TextField.isVisible = false
    BakingSodaTimer = timer.performWithDelay(20, DissapearBakingSoda) 
end
local function DissapearButter( event )
    Butter.x=Butter.x+2
    Butter.y = Butter.y + 3
    Butter.text = "Butter"
    Butter:scale(1.005,1.005)
    ButterTextField.x = ButterTextField.x - 0.5
    ButterTextField.y = ButterTextField.y + 2
    ButterTextField:scale(1.005,1.005)
    ButterTextField.isVisible = false
    Butter.alpha = Butter.alpha - 0.005
    ButterTimer = timer.performWithDelay(20, DissapearButter)
end
local function DissapearEggs( event )
    Eggs1.text = "Eggs"
    Eggs1.x=Eggs1.x+2.5
    Eggs1.y = Eggs1.y+2.5
    Eggs1:scale(1.002,1.002)
    Eggs1TextField.x = Eggs1TextField.x - 0.9
    Eggs1TextField.y = Eggs1TextField.y +1
    Eggs1TextField:scale(1.002,1.002)
    Eggs2.x = Eggs2.x-0.9
    Eggs2.y = Eggs2.y + 1
    Eggs2:scale(1.002,1.002)
    Eggs2.isVisible = false
    Eggs1.alpha = Eggs1.alpha - 0.005
    Eggs2.isVisible = false
    Eggs1TextField.isVisible = false
    EggsTimer = timer.performWithDelay(20,DissapearEggs)
end
local function DissapearFlour( event )
    Flour.text = "Flour"
    Flour.x=Flour.x+3
    Flour.y = Flour.y + 2
    Flour:scale(1.0015,1.0015)
    FlourTextField.x = FlourTextField.x-2.9
    FlourTextField.y = FlourTextField.y + 2
    FlourTextField:scale(1.0015,1.0015)
    FlourTextField.isVisible = false
    Flour.alpha = Flour.alpha - 0.01
    FlourTimer = timer.performWithDelay(20,DissapearFlour)
end
local function DissapearMilk( event )
    Milk.text = "Milk"
    Milk.x=Milk.x+3
    Milk.y = Milk.y + 1
    Milk:scale(1.0015,1.0015)
    MilkTextField.x = MilkTextField.x - 1.95
    MilkTextField.y = MilkTextField.y + 2
    MilkTextField:scale(1.0015,1.0015)
    MilkTextField.isVisible = false
    Milk.alpha = Milk.alpha - 0.01
    MilkTimer = timer.performWithDelay(20, DissapearMilk)
end
local function DissapearSalt( event )
    Salt.text = "Salt"
    Salt.x=Salt.x+3
    Salt.y = Salt.y + 1
    Salt:scale(1.0015,1.0015)
    SaltTextField.x = SaltTextField.x + 2.05
    SaltTextField.y = SaltTextField.y + 1.5
    SaltTextField:scale(1.0015,1.0015)
    SaltTextField.isVisible = false
    Salt.alpha = Salt.alpha - 0.01
    SaltTimer = timer.performWithDelay(20, DissapearSalt)
end
local function DissapearSugar( event )
    Sugar.text = "Sugar"
    Sugar.x=Sugar.x+4
    Sugar.y = Sugar.y+1
    Sugar:scale(1.0015,1.0015)
    SugarTextField.x = SugarTextField.x+2.1
    SugarTextField.y = SugarTextField.y + 2
    SugarTextField:scale(1.0015,1.0015)
    SugarTextField.isVisible = false
    Sugar.alpha = Sugar.alpha - 0.01
    SugarTimer = timer.performWithDelay(20, DissapearSugar)
    timer.performWithDelay(2000, WinScreenTransition)
end
local function BakingPowder1Q( event )
    userAnswerBakingPowder1 = tostring(event.target.text)
end
local function BakingPowder2Q( event )
    -- ask the question
    if (event.phase=="began")then

        --clear text field 
       BakingPowder2TextField.text=""
    elseif(event.phase=="submitted")then
        userAnswerBakingPowder2 = tostring(event.target.text)
        if (userAnswerBakingPowder2 == ANSWERBAKINGPOWDER2) and (userAnswerBakingPowder1 == ANSWERBAKINGPOWDER1)then
            correctObject.isVisible = true
            correctSoundChannel = audio.play(correctSound)
            timer.performWithDelay(2000,incorrectcorrectObjectinvisible)
            incorrectTextObject.isVisible = false
            BakingPowder1TextField.text = ""
            BakingPowder2TextField.text = ""
            BakingSodaV = true
            DissapearBakingPowder()
            BakingSoda()
        else
            if(lives==3)then
                heart3.isVisible=false
            elseif(lives==2) then
                heart2.isVisible=false
            elseif(lives==1)then
                heart1.isVisible=false
            end
            incorrectTextObject.isVisible = true
            incorrectSoundChannel = audio.play(incorrectSound)
            incorrectTextObject.text = ("That is incorrect.You Lose a life")
            timer.performWithDelay(200,incorrectcorrectObjectinvisible)
            correctObject.isVisible = false
            lives = lives-1
            BakingPowder1TextField.text = ""
            BakingPowder2TextField.text = ""
            BakingSodaV = true
        end
    end
end

local function BakingSoda1Q( event )
    userAnswerBakingSoda1 = tostring(event.target.text)
end
local function BakingSoda2Q( event )
    -- ask the question
    if (event.phase=="began")then

        --clear text field 
       BakingSoda2TextField.text=""
    elseif(event.phase=="submitted")then
        userAnswerBakingSoda2 = tostring(event.target.text)
        if (userAnswerBakingSoda2 == ANSWERBAKINGSODA2) and (userAnswerBakingSoda1 == ANSWERBAKINGSODA1)then
            correctObject.isVisible = true
            correctSoundChannel = audio.play(correctSound)
            timer.performWithDelay(2000,incorrectcorrectObjectinvisible)
            incorrectTextObject.isVisible = false
            BakingSodaV = false
            ButterV = true
            BakingSoda1TextField.text = ""
            BakingSoda2TextField.text = ""
            DissapearBakingSoda()
            Butter1()

        else
            if(lives==3)then
                heart3.isVisible=false
            elseif(lives==2) then
                heart2.isVisible=false
            elseif(lives==1)then
                heart1.isVisible=false
            end
            incorrectTextObject.isVisible = true
            incorrectSoundChannel = audio.play(incorrectSound)
            incorrectTextObject.text = ("That is incorrect.You Lose a life. Try again")
            timer.performWithDelay(2000,incorrectcorrectObjectinvisible)
            correctObject.isVisible = false
            BakingSoda1TextField.text = ""
            BakingSoda2TextField.text = ""
            lives = lives-1
            BakingSodaV = false
            ButterV = true
        end
    end
end
local function ButterQ( event )
    -- ask the question
    if (event.phase=="began")then

        --clear text field 
       ButterTextField.text=""
    elseif(event.phase=="submitted")then
        userAnswerButter = tostring(event.target.text)
        if (userAnswerButter == ANSWERBUTTER)then
            correctObject.isVisible = true
            correctSoundChannel = audio.play(correctSound)
            timer.performWithDelay(2000,incorrectcorrectObjectinvisible)
            incorrectTextObject.isVisible = false
            ButterV = false
            EggsV = true
            ButterTextField.text = ""
            DissapearButter()
            Eggs()
        else
            if(lives==3)then
                heart3.isVisible=false
            elseif(lives==2) then
                heart2.isVisible=false
            elseif(lives==1)then
                heart1.isVisible=false
            end
            incorrectTextObject.isVisible = true
            incorrectSoundChannel = audio.play(incorrectSound)
            incorrectTextObject.text = ("That is incorrect.You Lose a life. Try again")
            timer.performWithDelay(2000,incorrectcorrectObjectinvisible)
            correctObject.isVisible = false
            lives = lives-1
            ButterV = false
            EggsV = true
            ButterTextField.text = ""
        end
    end
end
local function EggsQ( event )
    -- ask the question
    if (event.phase=="began")then

        --clear text field 
       Eggs1TextField.text=""
    elseif(event.phase=="submitted")then
        userAnswerEggs = tostring(event.target.text)
        if (userAnswerEggs == ANSWEREGGS)then
            correctObject.isVisible = true
            correctSoundChannel = audio.play(correctSound)
            timer.performWithDelay(2000,incorrectcorrectObjectinvisible)
            incorrectTextObject.isVisible = false
            EggsV = false
            FlourV = true
            Eggs1TextField.text = ""
            DissapearEggs()
            Flour1()
        else
            if(lives==3)then
                heart3.isVisible=false
            elseif(lives==2) then
                heart2.isVisible=false
            elseif(lives==1)then
                heart1.isVisible=false
            end
            incorrectTextObject.isVisible = true
            incorrectSoundChannel = audio.play(incorrectSound)
            incorrectTextObject.text = ("That is incorrect.You Lose a life. Try again")
            timer.performWithDelay(2000,incorrectcorrectObjectinvisible)
            correctObject.isVisible = false
            Eggs1TextField.text = ""
            lives = lives-1
            EggsV = false
            FlourV = true
        end
    end
end
local function FlourQ( event )
    -- ask the question
    if (event.phase=="began")then

        --clear text field 
       FlourTextField.text=""
    elseif(event.phase=="submitted")then
        userAnswerFlour = tostring(event.target.text)
        if (userAnswerFlour == ANSWERFLOUR)then
            correctObject.isVisible = true
            correctSoundChannel = audio.play(correctSound)
            timer.performWithDelay(2000,incorrectcorrectObjectinvisible)
            incorrectTextObject.isVisible = false
            FlourTextField.text = ""
            FlourV = false
            MilkV = true
            DissapearFlour()
            Milk1()
        else
            if(lives==3)then
                heart3.isVisible=false
            elseif(lives==2) then
                heart2.isVisible=false
            elseif(lives==1)then
                heart1.isVisible=false
            end
            incorrectTextObject.isVisible = true
            incorrectSoundChannel = audio.play(incorrectSound)
            incorrectTextObject.text = ("That is incorrect.You Lose a life. Try again")
            timer.performWithDelay(2000,incorrectcorrectObjectinvisible)
            correctObject.isVisible = false
            FlourTextField.text = ""
            lives = lives-1
            FlourV = false
            MilkV = true

        end
    end
end
local function MilkQ( event )
    -- ask the question
    if (event.phase=="began")then

        --clear text field 
       MilkTextField.text=""
    elseif(event.phase=="submitted")then
        userAnswerMilk = tostring(event.target.text)
        if (userAnswerMilk == ANSWERMILK)then
            correctObject.isVisible = true
            correctSoundChannel = audio.play(correctSound)
            timer.performWithDelay(2000,incorrectcorrectObjectinvisible)
            incorrectTextObject.isVisible = false
            MilkTextField.text = ""
            SaltV = true
            MilkV = false
            DissapearMilk()
            Salt1()
        else
            if(lives==3)then
                heart3.isVisible=false
            elseif(lives==2) then
                heart2.isVisible=false
            elseif(lives==1)then
                heart1.isVisible=false
            end
            incorrectTextObject.isVisible = true
            incorrectSoundChannel = audio.play(incorrectSound)
            incorrectTextObject.text = ("That is incorrect.You Lose a life. Try again")
            timer.performWithDelay(2000,incorrectcorrectObjectinvisible)
            correctObject.isVisible = false
            MilkTextField.text = ""
            lives = lives-1
            MilkV = false
            SaltV = true
        end
    end
end
local function SaltQ( event )
    -- ask the question
    if (event.phase=="began")then

        --clear text field 
       SaltTextField.text=""
    elseif(event.phase=="submitted")then
        userAnswerSalt = tostring(event.target.text)
        if (userAnswerSalt == ANSWERSALT)then
            correctObject.isVisible = true
            correctSoundChannel = audio.play(correctSound)
            timer.performWithDelay(2000,incorrectcorrectObjectinvisible)
            incorrectTextObject.isVisible = false
            SaltTextField.text = ""
            SaltV = false
            SugarV = true
            DissapearSalt()
            Sugar1()
        else
            if(lives==3)then
                heart3.isVisible=false
            elseif(lives==2) then
                heart2.isVisible=false
            elseif(lives==1)then
                heart1.isVisible=false
            end
            incorrectTextObject.isVisible = true
            incorrectSoundChannel = audio.play(incorrectSound)
            incorrectTextObject.text = ("That is incorrect.You Lose a life. Try again")
            timer.performWithDelay(2000,incorrectcorrectObjectinvisible)
            correctObject.isVisible = false
            SaltTextField.text = ""
            lives = lives-1
            SaltV = false
            SugarV = true
        end
    end
end
local function SugarQ( event )
    -- ask the question
    if (event.phase=="began")then

        --clear text field 
       SugarTextField.text=""
    elseif(event.phase=="submitted")then
        userAnswerSugar = tostring(event.target.text)
        if (userAnswerSugar == ANSWERSUGAR)then
            correctObject.isVisible = true
            correctSoundChannel = audio.play(correctSound)
            timer.performWithDelay(2000,incorrectcorrectObjectinvisible)
            incorrectTextObject.isVisible = false
            SugarTextField.text = ""
            SugarV = false
            DissapearSugar()
        else
            if(lives==3)then
                heart3.isVisible=false
            elseif(lives==2) then
                heart2.isVisible=false
            elseif(lives==1)then
                heart1.isVisible=false
            end
            incorrectTextObject.isVisible = true
            incorrectSoundChannel = audio.play(incorrectSound)
            incorrectTextObject.text = ("That is incorrect.You Lose a life. Try again")
            timer.performWithDelay(2000,incorrectcorrectObjectinvisible)
            correctObject.isVisible = false
            SugarTextField.text = ""
            lives = lives-1
            SugarV = false
        end
    end
end
local function Updatetime()
    -- decrement the number of seconds
    secondsleft = secondsleft-1
    --display the number of seconds in a clock 
    clockText.text=secondsleft..""
    if(secondsleft==0) then
        secondsleft=totalseconds
        incorrectTextObject.isVisible=true
        incorrectTextObject.text=("You ran out of time :(.You lose a life")
        lives=lives-1
        timer.performWithDelay(5000, incorrectcorrectObjectinvisible)
        if(lives==2)then
            heart3.isVisible=false
        elseif(lives==1) then
            heart2.isVisible=false
        else
        --    questionObject.isVisible=false
        --    correctObject.isVisible=false
        --    numericField.isVisible=false
        --    incorrectTextObject.isVisible=false
        --    pointsText.isVisible=false
        --    youlostImage.isVisible=true
        --    timer.performWithDelay(1000)
        end
    end    
end

--call the timer
 function StartTimer()
    -- create a countDown Timer that loops infinitely
    countDownTimer=timer.performWithDelay( 1000, Updatetime, 0)
end
StartTimer()
-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    -- Insert the background image
    bkg = display.newImageRect("Images/level2screen.png", display.contentWidth, display.contentHeight)
    bkg.x = display.contentCenterX
    bkg.y = display.contentCenterY
    bkg.width = display.contentWidth
    bkg.height = display.contentHeight
        -- Insert background image into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( bkg )  
    -- insert first ingredient 

    BakingPowder1 = display.newText("Bakin ", 50 ,110, Arial, 35)
    BakingPowder1:setTextColor(0,0,0) 
    BakingPowder1TextField = native.newTextField(105 , 110 , 30 , 35)
    BakingPowder1TextField.inputType = "no-emoji"
    BakingPowder1TextField:setTextColor(0,0.3,0)
    BakingPowder2 = display.newText("Powde", 180 , 110 , Arial , 35)
    BakingPowder2:setTextColor(0,0,0)
    BakingPowder2TextField = native.newTextField(250, 110 , 30 , 35)
    BakingPowder2TextField:setTextColor(0,0.3,0)
    BakingPowder2TextField.inputType = "no-emoji"
    BakingSoda1 = display.newText("Bakin", 340 , 110 , Arial , 35)
    BakingSoda1:setTextColor(0,0,0)
    BakingSoda1TextField = native.newTextField(400 , 110 , 30 , 35)
    BakingSoda1TextField:setTextColor(0,0.3,0)
    BakingSoda1TextField.inputType = "no-emoji"
    BakingSoda2 = display.newText("sod", 450 , 110, Arial, 35)
    BakingSoda2:setTextColor(0,0,0)
    BakingSoda2TextField = native.newTextField(500 , 110 , 30 , 35)
    BakingSoda2TextField:setTextColor(0,0.3,0)
    BakingSoda1TextField.inputType = "no-emoji"
    Butter = display.newText("Butte", 580, 110, Arial , 35)
    Butter:setTextColor(0,0,0)
    ButterTextField = native.newTextField(635 , 110, 30 , 35)
    ButterTextField:setTextColor(0,0.3,0)
    ButterTextField.inputType = "no-emoji"
    Eggs1 = display.newText("Eg", 680, 110, Arial, 35)
    Eggs1:setTextColor(0,0,0)
    Eggs1TextField = native.newTextField(720, 110, 30, 35)
    Eggs1TextField:setTextColor(0,0.3,0)
    Eggs1TextField.inputType = "no-emoji"
    Eggs2 = display.newText("s", 750, 110, Arial ,35)
    Eggs2:setTextColor(0,0,0)
    Flour = display.newText("Flou", 800, 110, Arial, 35)
    Flour:setTextColor(0,0,0)
    FlourTextField = native.newTextField(850, 110, 30, 35)
    FlourTextField:setTextColor(0,0.3,0)
    FlourTextField.inputType = "no-emoji"
    Milk = display.newText("Mil",900, 110, Arial, 35)
    Milk:setTextColor(0,0,0)
    MilkTextField = native.newTextField(940, 110, 30, 35)
    MilkTextField:setTextColor(0,0.3,0)
    Salt = display.newText("Sal", 30, 150, Arial, 35)
    Salt:setTextColor(0,0,0)
    SaltTextField = native.newTextField(80, 150, 30, 35)
    SaltTextField:setTextColor(0,0.3,0)
    SaltTextField.inputType = "no-emoji"
    Sugar = display.newText("Suga", 140, 150, Arial, 35)
    Sugar:setTextColor(0,0,0)
    SugarTextField = native.newTextField(200, 150, 30, 35)
    correctObject = display.newText("Hey dude that's correct!", display.contentCenterX,display.contentCenterY, Arial, 70)
    correctObject:setTextColor(0,0,0)
    correctObject.isVisible = false
    sceneGroup:insert(correctObject)
    incorrectTextObject = display.newText("Sorry but that's wrong.", display.contentCenterX, display.contentCenterY, Arial, 40)
    incorrectTextObject:setTextColor(0,0,0)
    incorrectTextObject.isVisible = false
    sceneGroup:insert(incorrectTextObject)
        --create the lives
    heart1=display.newImageRect("Images/heart1.png", 100, 100)
    heart1.x=display.contentWidth*7/11
    heart1.y=display.contentHeight*1/17
    heart1:scale(0.5,0.5)
    sceneGroup:insert(heart1)

    heart2=display.newImageRect("Images/heart1.png", 100, 100)
    heart2.x=display.contentWidth*8/11
    heart2.y=display.contentHeight*1/17
    heart2:scale(0.5,0.5)
    sceneGroup:insert(heart2)

    heart3=display.newImageRect("Images/heart1.png", 100, 100)
    heart3.x=display.contentWidth*9/11
    heart3.y=display.contentHeight*1/17
    heart3:scale(0.5,0.5)
    sceneGroup:insert(heart3)
    clockText=display.newText("60", display.contentWidth/3, display.contentHeight/5, nil, 50)
    clockText:setTextColor(255/255, 2/255, 198/255)
    clockText.isVisible=true
    sceneGroup:insert(clockText)

    pauseButton = display.newImageRect("Images/pause button.png", 500,100)
    pauseButton.width = 100
    pauseButton.height = 100
    pauseButton.x = 900
    pauseButton.y = 200
end 
 --function scene:create( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then

        -- Called when the scene is still off screen (but is about to come on screen).
    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        BakingPowder()
        Butter:addEventListener("touch", Butter1)
        Eggs1:addEventListener("touch", Eggs)
        Eggs2:addEventListener("touch", Eggs)
        Flour:addEventListener("touch", Flour1)
        Milk:addEventListener("touch", Milk1)
        Salt:addEventListener("touch", Salt1)
        Sugar:addEventListener("touch", Sugar1)
        pauseButton:addEventListener("touch", pause)
        BakingPowder1TextField:addEventListener("userInput", BakingPowder1Q)
        BakingPowder2TextField:addEventListener("userInput", BakingPowder2Q)
        BakingSoda1TextField:addEventListener("userInput", BakingSoda1Q)
        BakingSoda2TextField:addEventListener("userInput", BakingSoda2Q)
        ButterTextField:addEventListener("userInput", ButterQ)
        Eggs1TextField:addEventListener("userInput", EggsQ)
        FlourTextField:addEventListener("userInput", FlourQ)
        MilkTextField:addEventListener("userInput", MilkQ)
        SaltTextField:addEventListener("userInput", SaltQ)
        SugarTextField:addEventListener("userInput", SugarQ)
        if (soundOn == true) then     
            audio.resume(level1SoundChannel)
        else
            audio.pause(level1SoundChannel)      
        end
    end
end --function scene:show( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to leave the screen
function scene:hide( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then
        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.
        -- Example: stop timers, stop animation, stop audio, etc.

    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.
    end

end --function scene:hide( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to be destroyed
function scene:destroy( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    -- Called prior to the removal of scene's view ("sceneGroup").
    -- Insert code here to clean up the scene.
    -- Example: remove display objects, save state, etc.

end -- function scene:destroy( event )

-----------------------------------------------------------------------------------------
-- EVENT LISTENERS
-----------------------------------------------------------------------------------------

-- Adding Event Listeners
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene
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
-- GLOBAL VARIABLES
-----------------------------------------------------------------------------------------
pauseinstructions = false
saycorrect = false
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
local pauseButton
local Bowl
local totalseconds = 60
local lives = 4
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
level2Sound = audio.loadSound("Sounds/Level2screenmusic.mp3")
level2SoundChannel = audio.play(level2Sound,{loops = -1})
local correctSound = audio.loadSound("Sounds/correctsound.wav")
local correctSoundChannel
local incorrectSound = audio.loadSound("Sounds/incorrectsound.wav")
local incorrectSoundChannel
-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------
local function setAnswers(  )
    ANSWERBAKINGPOWDER1 = "g"
    ANSWERBAKINGPOWDER2 = "r"
    ANSWERBAKINGSODA1 = "g"
    ANSWERBAKINGSODA2 = "a"
    ANSWERBUTTER = "r"
    ANSWEREGGS = "g"
    ANSWERFLOUR = "r"
    ANSWERMILK = "k"
    ANSWERSALT = "t"
    ANSWERSUGAR = "r"
end
local function youWinTransition( )
    audio.stop(level2SoundChannel)   
    pauseButton.isVisible = false
    timer.cancel(countDownTimer)
    composer.gotoScene( "YouWin", {effect = "slideRight", time = 1000})
end 
local function youLoseTransition(  )
    audio.stop(level2SoundChannel)
    timer.cancel(countDownTimer)
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
    composer.gotoScene("YouLose", {effect = "slideRight", time = 1000})
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
    setAnswers()
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
    BakingPowder1.x=BakingPowder1.x+6
    BakingPowder1.y = BakingPowder1.y+2.5
    BakingPowder1:scale(1.006,1.006)
    BakingPowder1TextField.x = BakingPowder1TextField.x + 6.45
    BakingPowder1TextField.y = BakingPowder1TextField.y + 2.5
    BakingPowder1TextField:scale(1.006,1.006)
    BakingPowder2.x=BakingPowder2.x+6.87
    BakingPowder2.y = BakingPowder2.y + 2.5
    BakingPowder2:scale(1.006,1.006)
    BakingPowder2TextField.x = BakingPowder2TextField.x + 7.3
    BakingPowder2TextField.y = BakingPowder2TextField.y + 2.5
    BakingPowder2TextField:scale(1.006,1.006)
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
    BakingSoda1:scale(1.007,1.007)
    BakingSoda1TextField.x = BakingSoda1TextField.x +3.5
    BakingSoda1TextField.y = BakingSoda1TextField.y + 3
    BakingSoda2.x = BakingSoda2.x+4
    BakingSoda2.y = BakingSoda2.y + 3
    BakingSoda2:scale(1.007,1.007)
    BakingSoda2TextField.x = BakingSoda2TextField.x + 4.5
    BakingSoda2TextField.y = BakingSoda2TextField.y + 3
    BakingSoda2TextField:scale(1.005,1.007)
    BakingSoda1TextField:scale(1.007,1.007)
    if (BakingSoda1.x >= display.contentCenterX)then
        BakingSoda1TextField:resizeFontToFitHeight()
        BakingSoda2TextField:resizeFontToFitHeight()
        timer.cancel(BakingSodaTimer)
    else
        BakingSodaTimer = timer.performWithDelay(-0.01, BakingSoda)        
    end
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
        Flour:scale(1.005,1.005)
        FlourTextField.x = FlourTextField.x-2.6
        FlourTextField.y = FlourTextField.y + 2
        FlourTextField:scale(1.005,1.005)
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
        Milk.x=Milk.x-4.5
        Milk.y = Milk.y + 2
        Milk:scale(1.005,1.005)
        MilkTextField.x = MilkTextField.x - 4
        MilkTextField.y = MilkTextField.y + 2
        MilkTextField:scale(1.005,1.005)
        if(Milk.x <= display.contentCenterX)then
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
        Salt.x=Salt.x+4
        Salt.y = Salt.y + 1.5
        Salt:scale(1.0015,1.0015)
        SaltTextField.x = SaltTextField.x + 4.10
        SaltTextField.y = SaltTextField.y + 1.5
        SaltTextField:scale(1.0015,1.0015)
        if(Salt.x >= display.contentCenterX)then
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
local function DissapearBakingPowder(  )
    if (touch.phase == "began") then
end
local function incorrectcorrectObjectinvisible(  )
    -- hide the correct and incorrect objects
    incorrectTextObject.isVisible = false
    correctObject.isVisible = false
end

local function checkAnswers(  )
    lives = lives-1
    if(lives==3)then
        heart3.isVisible=false
    elseif(lives==2) then
        heart2.isVisible=false
    elseif(lives==1)then
        heart1.isVisible=false
        youLoseTransition()
    end    
end

local function BakingPowder1Q( event )

        userAnswerBakingPowder1 = tostring(event.target.text)
    if(saycorrect == true) then
        if(event.phase=="submitted")then
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
                checkAnswers()
                incorrectTextObject.isVisible = true
                incorrectSoundChannel = audio.play(incorrectSound)
                incorrectTextObject.text = ("That is incorrect.You Lose a life")
                timer.performWithDelay(2000,incorrectcorrectObjectinvisible)
                correctObject.isVisible = false
                BakingSodaV = true
            end
        end
    end

end

local function BakingPowder2Q( event )
        userAnswerBakingPowder2 = tostring(event.target.text)
        saycorrect = true
    if(event.phase=="submitted")then

        if (userAnswerBakingPowder2 == ANSWERBAKINGPOWDER2) and (userAnswerBakingPowder1 == ANSWERBAKINGPOWDER1)then
        BakingPowder1TextField:removeEventListener("userInput", BakingPowder1Q)
        BakingPowder2TextField:removeEventListener("userInput", BakingPowder2Q)
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
            checkAnswers()
            incorrectTextObject.isVisible = true
            incorrectSoundChannel = audio.play(incorrectSound)
            incorrectTextObject.text = ("That is incorrect.You Lose a life")
            timer.performWithDelay(2000,incorrectcorrectObjectinvisible)
            correctObject.isVisible = false
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
            BakingSoda1TextField:removeEventListener("userInput", BakingSoda1Q)
            BakingSoda2TextField:removeEventListener("userInput", BakingSoda2Q)
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
            checkAnswers()
            incorrectTextObject.isVisible = true
            incorrectSoundChannel = audio.play(incorrectSound)
            incorrectTextObject.text = ("That is incorrect.You Lose a life. Try again")
            timer.performWithDelay(2000,incorrectcorrectObjectinvisible)
            correctObject.isVisible = false
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
            ButterTextField:removeEventListener("userInput", ButterQ)
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
            checkAnswers()
            incorrectTextObject.isVisible = true
            incorrectSoundChannel = audio.play(incorrectSound)
            incorrectTextObject.text = ("That is incorrect.You Lose a life. Try again")
            timer.performWithDelay(2000,incorrectcorrectObjectinvisible)
            correctObject.isVisible = false
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
            Eggs1TextField:removeEventListener("userInput", EggsQ)        
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
            checkAnswers()
            incorrectTextObject.isVisible = true
            incorrectSoundChannel = audio.play(incorrectSound)
            incorrectTextObject.text = ("That is incorrect.You Lose a life. Try again")
            timer.performWithDelay(2000,incorrectcorrectObjectinvisible)
            correctObject.isVisible = false
            Eggs1TextField.text = ""
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
            FlourTextField:removeEventListener("userInput", FlourQ)
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
            checkAnswers()
            incorrectTextObject.isVisible = true
            incorrectSoundChannel = audio.play(incorrectSound)
            incorrectTextObject.text = ("That is incorrect.You Lose a life. Try again")
            timer.performWithDelay(2000,incorrectcorrectObjectinvisible)
            correctObject.isVisible = false
            FlourTextField.text = ""
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
            MilkTextField:removeEventListener("userInput", MilkQ)
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
            checkAnswers()
            incorrectTextObject.isVisible = true
            incorrectSoundChannel = audio.play(incorrectSound)
            incorrectTextObject.text = ("That is incorrect.You Lose a life. Try again")
            timer.performWithDelay(2000,incorrectcorrectObjectinvisible)
            correctObject.isVisible = false
            MilkTextField.text = ""
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
            SaltTextField:removeEventListener("userInput", SaltQ)
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
            checkAnswers()
            incorrectTextObject.isVisible = true
            incorrectSoundChannel = audio.play(incorrectSound)
            incorrectTextObject.text = ("That is incorrect.You Lose a life. Try again")
            timer.performWithDelay(2000,incorrectcorrectObjectinvisible)
            correctObject.isVisible = false
            SaltTextField.text = ""
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
            SugarTextField:removeEventListener("userInput", SugarQ)
            correctObject.isVisible = true
            correctSoundChannel = audio.play(correctSound)
            timer.performWithDelay(2000,incorrectcorrectObjectinvisible)
            incorrectTextObject.isVisible = false
            SugarTextField.text = ""
            SugarV = false
            DissapearSugar()
            youWinTransition()
        else
            checkAnswers()
            incorrectTextObject.isVisible = true
            incorrectSoundChannel = audio.play(incorrectSound)
            incorrectTextObject.text = ("That is incorrect.You Lose a life. Try again")
            timer.performWithDelay(2000,incorrectcorrectObjectinvisible)
            correctObject.isVisible = false
            SugarTextField.text = ""
            SugarV = false
        end
    end
end

local function Updatetime()
    -- decrement the number of seconds
    secondsleft = secondsleft-1
    --display the number of seconds in a clock 
    clockText.text=secondsleft..""
    if (secondsleft == 0) then
        secondsleft=totalseconds
        incorrectTextObject.isVisible=true
        incorrectTextObject.text=("You ran out of time :(.You lose a life")
        timer.performWithDelay(5000, incorrectcorrectObjectinvisible)
        checkAnswers()
    end    
end

--call the timer
local function StartTimer()
    secondsleft = totalseconds
    countDownTimer=timer.performWithDelay( 1000, Updatetime, 0)
end

local function AddEventListeners()
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
end

local function RemoveEventListeners()
    pauseButton:removeEventListener("touch", pause)
    BakingPowder1TextField:removeEventListener("userInput", BakingPowder1Q)
    BakingPowder2TextField:removeEventListener("userInput", BakingPowder2Q)
    BakingSoda1TextField:removeEventListener("userInput", BakingSoda1Q)
    BakingSoda2TextField:removeEventListener("userInput", BakingSoda2Q)
    ButterTextField:removeEventListener("userInput", ButterQ)
    Eggs1TextField:removeEventListener("userInput", EggsQ)
    FlourTextField:removeEventListener("userInput", FlourQ)
    MilkTextField:removeEventListener("userInput", MilkQ)
    SaltTextField:removeEventListener("userInput", SaltQ)
    SugarTextField:removeEventListener("userInput", SugarQ)
end

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
    sceneGroup:insert( BakingPowder1 )  

    BakingPowder1TextField = native.newTextField(105 , 110 , 30 , 35)
    BakingPowder1TextField.inputType = "no-emoji"
    BakingPowder1TextField:setTextColor(0,0.3,0)
    sceneGroup:insert( BakingPowder1TextField )  
    
    BakingPowder2 = display.newText("Powde", 180 , 110 , Arial , 35)
    BakingPowder2:setTextColor(0,0,0)
    sceneGroup:insert( BakingPowder2 )  

    BakingPowder2TextField = native.newTextField(250, 110 , 30 , 35)
    BakingPowder2TextField:setTextColor(0,0.3,0)
    BakingPowder2TextField.inputType = "no-emoji"
    sceneGroup:insert( BakingPowder2TextField )  

    BakingSoda1 = display.newText("Bakin", 340 , 110 , Arial , 35)
    BakingSoda1:setTextColor(0,0,0)
    sceneGroup:insert( BakingSoda1 )  

    BakingSoda1TextField = native.newTextField(400 , 110 , 30 , 35)
    BakingSoda1TextField:setTextColor(0,0.3,0)
    BakingSoda1TextField.inputType = "no-emoji"
    sceneGroup:insert( BakingSoda1TextField )  

    BakingSoda2 = display.newText("sod", 450 , 110, Arial, 35)
    BakingSoda2:setTextColor(0,0,0)
    sceneGroup:insert( BakingSoda2 )  

    BakingSoda2TextField = native.newTextField(500 , 110 , 30 , 35)
    BakingSoda2TextField:setTextColor(0,0.3,0)
    BakingSoda2TextField.inputType = "no-emoji"
    sceneGroup:insert( BakingSoda2TextField )  

    Butter = display.newText("Butte", 580, 110, Arial , 35)
    Butter:setTextColor(0,0,0)
    sceneGroup:insert( Butter )  

    ButterTextField = native.newTextField(635 , 110, 30 , 35)
    ButterTextField:setTextColor(0,0.3,0)
    ButterTextField.inputType = "no-emoji"
    sceneGroup:insert( ButterTextField )  

    Eggs1 = display.newText("Eg", 680, 110, Arial, 35)
    Eggs1:setTextColor(0,0,0)
    sceneGroup:insert( Eggs1 )  

    Eggs1TextField = native.newTextField(720, 110, 30, 35)
    Eggs1TextField:setTextColor(0,0.3,0)
    Eggs1TextField.inputType = "no-emoji"
    sceneGroup:insert( Eggs1TextField )  

    Eggs2 = display.newText("s", 750, 110, Arial ,35)
    Eggs2:setTextColor(0,0,0)
    sceneGroup:insert( Eggs2 )  

    Flour = display.newText("Flou", 800, 110, Arial, 35)
    Flour:setTextColor(0,0,0)
    sceneGroup:insert( Flour )  

    FlourTextField = native.newTextField(850, 110, 30, 35)
    FlourTextField:setTextColor(0,0.3,0)
    FlourTextField.inputType = "no-emoji"
    sceneGroup:insert( FlourTextField )

    Milk = display.newText("Mil",900, 110, Arial, 35)
    Milk:setTextColor(0,0,0)
    sceneGroup:insert( Milk )

    MilkTextField = native.newTextField(940, 110, 30, 35)
    MilkTextField:setTextColor(0,0.3,0)
    MilkTextField.inputType = "no-emoji"
    sceneGroup:insert( MilkTextField )  

    Salt = display.newText("Sal", 30, 150, Arial, 35)
    Salt:setTextColor(0,0,0)
    sceneGroup:insert( Salt )

    SaltTextField = native.newTextField(80, 150, 30, 35)
    SaltTextField:setTextColor(0,0.3,0)
    SaltTextField.inputType = "no-emoji"
    sceneGroup:insert( SaltTextField )

    Sugar = display.newText("Suga", 140, 150, Arial, 35)
    Sugar:setTextColor(0,0,0)
    sceneGroup:insert( Sugar )

    SugarTextField = native.newTextField(200, 150, 30, 35)
    SugarTextField:setTextColor(0,0.3,0)
    SugarTextField.inputType = "no-emoji"
    sceneGroup:insert( SugarTextField )

    correctObject = display.newText("Hey dude that's correct!", display.contentCenterX,display.contentCenterY*6/10, Arial, 60)
    correctObject:setTextColor(0,0,0)
    correctObject.isVisible = false
    sceneGroup:insert(correctObject)

    incorrectTextObject = display.newText("Sorry but that's wrong.", display.contentCenterX, display.contentCenterY*6/10, Arial, 40)
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
    sceneGroup:insert( pauseButton )

    Bowl = display.newImageRect("Images/BowlNicR.png", 200, 200)
    Bowl.width = 150
    Bowl.height = 100
    Bowl.x = 500
    Bowl.y = 525

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
        --composer.removeScene("mainmenu")
        RemoveEventListeners()
        if (soundOn == true) then     
            audio.resume(level2SoundChannel)
        else
            audio.pause(level2SoundChannel)      
        end
       
        if (pauseinstructions == true) then
            pause()
        end
        -- Called when the scene is still off screen (but is about to come on screen).
    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        StartTimer()
        BakingPowder()
        AddEventListeners() 

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
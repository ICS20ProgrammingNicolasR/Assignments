-----------------------------------------------------------------------------------------
--
-- level1_screen.lua
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
sceneName = "level1_screen"

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
local answerBakingPowder1 = "g"
local answerBakingPowder2 = "r"
local answerBakingSoda1 = "g"
local answerBakingSoda2 = "a"
local answerButter = "r"
local answerEggs = "g"
local answerFlour = "r"
local answerMilk = "k"
local answerSalt = "t"
local answerSugar = "r"
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
-----------------------------------------------------------------------------------------
-- LOCAL SOUNDS
-----------------------------------------------------------------------------------------
--local level1Sound = audio.loadSound("Sounds/level1screenmusic.mp3")
--local level1SoundChannel = audio.play(level1Sound,{loops = -1})
local correctSound = audio.loadSound("Sounds/correctsound.wav")
local correctSoundChannel
local incorrectSound = audio.loadSound("Sounds/incorrectsound.wav")
local incorrectSoundChannel
-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------
local function BakingPowder( touch )
        BakingPowder1.x=BakingPowder1.x+2
        BakingPowder1.y = BakingPowder1.y+1.5
        BakingPowder1:scale(1.0015,1.0015)
        BakingPowder1TextField.x = BakingPowder1TextField.x + 2.09
        BakingPowder1TextField.y = BakingPowder1TextField.y + 1.5
        BakingPowder1TextField:scale(1.0015,1.0015)
        BakingPowder2.x=BakingPowder2.x+2.18
        BakingPowder2.y = BakingPowder2.y + 1.5
        BakingPowder2:scale(1.0015,1.0015)
        BakingPowder2TextField.x = BakingPowder2TextField.x + 2.28
        BakingPowder2TextField.y = BakingPowder2TextField.y + 1.5
        BakingPowder2TextField:scale(1.0015,1.0015)
        if(BakingPowder1.x == display.contentCenterX)then
           BakingPowder1TextField:resizeFontToFitHeight()
           BakingPowder2TextField:resizeFontToFitHeight()
           timer.cancel(bakingpowdertimer)
        else
        bakingpowdertimer = timer.performWithDelay(30,BakingPowder)   
        end
end
local function BakingSoda( touch )
        BakingSoda1.x = BakingSoda1.x+2
        BakingSoda1.y = BakingSoda1.y+2
        BakingSoda1:scale(1.0015,1.0015)
        BakingSoda1TextField.x = BakingSoda1TextField.x +2.06
        BakingSoda1TextField.y = BakingSoda1TextField.y + 2
        BakingSoda2.x = BakingSoda2.x+2.1
        BakingSoda2.y = BakingSoda2.y + 2
        BakingSoda2:scale(1.0015,1.0015)
        BakingSoda2TextField.x = BakingSoda2TextField.x + 2.15
        BakingSoda2TextField.y = BakingSoda2TextField.y + 2
        BakingSoda2TextField:scale(1.0015,1.0015)
        BakingSoda1TextField:scale(1.0015,1.0015)
        if(BakingSoda1.x == display.contentCenterX)then
            BakingSoda1TextField:resizeFontToFitHeight()
            BakingSoda2TextField:resizeFontToFitHeight()
            timer.cancel(BakingSodaTimer)
        else
        BakingSodaTimer = timer.performWithDelay(30, BakingSoda) 
        end
end
local function Butter1( touch )
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
            ButterTimer = timer.performWithDelay(30, Butter1)
        end
end
local function Eggs( touch )
        Eggs1.x=Eggs1.x-1
        Eggs1.y = Eggs1.y+1
        Eggs1:scale(1.002,1.002)
        Eggs1TextField.x = Eggs1TextField.x - 0.9
        Eggs1TextField.y = Eggs1TextField.y +1
        Eggs1TextField:scale(1.002,1.002)
        Eggs2.x=Eggs2.x-0.9
        Eggs2.y = Eggs2.y + 1
        Eggs2:scale(1.002,1.002)
        if(Eggs1.x == display.contentCenterX)then
            timer.cancel(EggsTimer)
            Eggs1TextField:resizeFontToFitHeight()
        else
            EggsTimer = timer.performWithDelay(30,Eggs)
        end
end
local function Flour1( touch )
        Flour.x=Flour.x-2
        Flour.y = Flour.y + 2
        Flour:scale(1.0015,1.0015)
        FlourTextField.x = FlourTextField.x-1.9
        FlourTextField.y = FlourTextField.y + 2
        FlourTextField:scale(1.0015,1.0015)
        if(Flour.x == display.contentCenterX)then
            timer.cancel(FlourTimer)
            FlourTextField:resizeFontToFitHeight()

        else
            FlourTimer = timer.performWithDelay(30,Flour1)
        end

end
local function Milk1( touch )
    
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
            MilkTimer = timer.performWithDelay(30, Milk1)
        end
end
local function Salt1( touch )
    
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
            SaltTimer = timer.performWithDelay(30, Salt1)
        end
end
local function Sugar1( touch )
    
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
            SugarTimer = timer.performWithDelay(30, Sugar1)
        end
end
local function incorrectcorrectObjectinvisible(  )
    -- hide the correct and incorrect objects
    incorrectTextObject.isVisible = false
    correctObject.isVisible = false
end
local function BakingPowder1Q( event )
    -- ask the question
    if (event.phase=="began")then

        --clear text field 
        event.target.text=""
    elseif(event.phase=="submitted")then
        userAnswerBakingPowder1 = tostring(event.target.text)
        if (userAnswerBakingPowder1 == answerBakingPowder1)then
            correctObject.isVisible = false
            correctSoundChannel = audio.play(correctSound)
            timer.performWithDelay(2000,incorrectcorrectObjectinvisible)
            incorrectTextObject.isVisible = false
        else
            if (lives==4)then
            heart4.isVisible=false
            elseif(lives==3)then
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
        end
    end
end
local function BakingPowder2Q( event )
    -- ask the question
    if (event.phase=="began")then

        --clear text field 
        event.target.text=""
    elseif(event.phase=="submitted")then
        userAnswerBakingPowder1 = tostring(event.target.text)
        if (userAnswerBakingPowder2 == answerBakingPowder2)then
            correctObject.isVisible = false
            correctSoundChannel = audio.play(correctSound)
            timer.performWithDelay(2000,incorrectcorrectObjectinvisible)
            incorrectTextObject.isVisible = false
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
local function StartTimer()
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
    bkg = display.newImageRect("Images/level1screen.png", display.contentWidth, display.contentHeight)
    bkg.x = display.contentCenterX
    bkg.y = display.contentCenterY
    bkg.width = display.contentWidth
    bkg.height = display.contentHeight
        -- Insert background image into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( bkg )  
    -- insert first ingredient 

    BakingPowder1 = display.newText("Bakin ", 50 ,110, Arial, 35)
    BakingPowder1:setTextColor(0,0,0) 
    BakingPowder1bkg = display.newImageRect("Images/Background Image.png",50,270)
    BakingPowder1bkg.x = BakingPowder1.x+90
    BakingPowder1bkg.y = BakingPowder1.y
    BakingPowder1bkg:rotate(90)
    BakingPowder1bkg:toBack()
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
    incorrectTextObject = display.newText("Sorry but that's wrong.", display.contentCenterX, display.contentCenterY, Arial, 70)
    incorrectTextObject:setTextColor(0,0,0)
    incorrectTextObject.isVisible = false
        --create the lives
    heart1=display.newImageRect("Images/heart1.png", 100, 100)
    heart1.x=display.contentWidth*7/11
    heart1.y=display.contentHeight*1/17
    heart1:scale(0.5,0.5)

    heart2=display.newImageRect("Images/heart1.png", 100, 100)
    heart2.x=display.contentWidth*8/11
    heart2.y=display.contentHeight*1/17
    heart2:scale(0.5,0.5)

    heart3=display.newImageRect("Images/heart1.png", 100, 100)
    heart3.x=display.contentWidth*9/11
    heart3.y=display.contentHeight*1/17
    heart3:scale(0.5,0.5)
    clockText=display.newText("60", display.contentWidth/3, display.contentHeight/5, nil, 50)
    clockText:setTextColor(255/255, 2/255, 198/255)
    clockText.isVisible=true
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
        BakingPowder1bkg:addEventListener("touch", BakingPowder)
        BakingSoda1:addEventListener("touch", BakingSoda)
        BakingSoda2:addEventListener("touch", BakingSoda)
        Butter:addEventListener("touch", Butter1)
        Eggs1:addEventListener("touch", Eggs)
        Eggs2:addEventListener("touch", Eggs)
        Flour:addEventListener("touch", Flour1)
        Milk:addEventListener("touch", Milk1)
        Salt:addEventListener("touch", Salt1)
        Sugar:addEventListener("touch", Sugar1)
        BakingPowder1TextField:addEventListener("userInput", BakingPowder1Q)
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
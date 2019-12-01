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
-----------------------------------------------------------------------------------------
-- LOCAL SOUNDS
-----------------------------------------------------------------------------------------
--local level1Sound = audio.loadSound("Sounds/level1screenmusic.mp3")
--local level1SoundChannel = audio.play(level1Sound,{loops = -1})
-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------
local function BakingPowder( touch )
        BakingPowder1.x=BakingPowder1.x+1
        BakingPowder1.y = BakingPowder1.y+0.5
        BakingPowder1:scale(1.001,1.001)
        BakingPowder1TextField.x = BakingPowder1.x + 70
        BakingPowder1TextField.y = BakingPowder1.y
        BakingPowder1TextField:scale(1.001,1.001)
        BakingPowder2.x=BakingPowder2.x+1
        BakingPowder2.y = BakingPowder2.y + 0.5
        BakingPowder2.width = BakingPowder2.width + 1
        BakingPowder2.height = BakingPowder2.height + 1
        if(BakingPowder1.x == display.contentCenterX)and (BakingPowder2.x == display.contentCenterX)then
            BakingPowder1.x = display.contentCenterX
            BakingPowder1.y = display.contentCenterY

        else
        timer.performWithDelay(30,BakingPowder)   
        end
end
local function BakingSoda( touch )
    if(touch.phase == "ended")then
        BakingSoda1.x=BakingSoda1.x+1
        BakingSoda1.width = BakingSoda1.width + 1
        BakingSoda1.height = BakingSoda1.height + 1
        BakingSoda1TextField.x = BakingSoda1TextField.x +1
        BakingSoda1TextField.width = BakingSoda1TextField.width +1
        BakingSoda1TextField.height = BakingSoda1TextField.height + 1
        if(BakingSoda1.x == 1024)then
            BakingSoda1.x = BakingSoda1.x - 1 
            BakingSoda1.width = BakingSoda1.width-1
            BakingSoda1.height = BakingSoda1.height - 1
            BakingSoda1TextField.x = BakingSoda1TextField.x + 1
            BakingSoda1TextField.width = BakingSoda1.width + 1
            BakingSoda1TextField.height = BakingSoda1.height + 1
        end
    end
end
local function Butter( touch )
    if(touch.phase == "ended")then
        Butter.x=Butter.x+1
        Butter.width = Butter.width + 1
        Butter.height = Butter.height + 1
        ButterTextField.x = Butter.x
        ButterTextField.width = Butter.width 
        ButterTextField.height = Butter.height
        if(Butter.x == 1024)then
            Butter.x = Butter.x - 1 
            Butter.width = Butter.width-1
            Butter.height = Butter.height - 1
            ButterTextField.x = Butter.x
            ButterTextField.width = Butter.width
            ButterTextField.height = Butter.height
        end
    end
end
local function Eggs( touch )
    if(touch.phase == "ended")then
        Eggs1.x=Eggs1.x+1
        Eggs1.width = Eggs1.width + 1
        Eggs1.height = Eggs1.height + 1
        Eggs1TextField.x = Eggs.x
        Eggs1TextField.width = Eggs.width 
        Eggs1TextField.height = Eggs.height
        Eggs2.x=Eggs2.x+1
        Eggs2.width = Eggs2.width + 1
        Eggs2.height = Eggs2.height + 1
        if(Eggs.x == 1024)then
            Eggs1.x = Eggs1.x - 1 
            Eggs1.width = Eggs1.width-1
            Eggs1.height = Eggs1.height - 1
            Eggs1TextField.x = Eggs1.x
            Eggs1TextField.width = Eggs1.width
            Eggs1TextField.height = Eggs1.height
            Egg2.x = Egg2.x - 1 
            Egg2.width = Egg2.width-1
            Egg2.height = Egg2.height - 1
            Egg2TextField.x = Egg2.x
            Egg2TextField.width = Egg2.width
            Egg2TextField.height = Egg2.height
        end
    end
end
local function Flour( touch )
    if(touch.phase == "ended")then
        Flour.x=Flour.x+1
        Flour.width = Flour.width + 1
        Flour.height = Flour.height + 1
        FlourTextField.x = Flour.x
        FlourTextField.width = Flour.width 
        FlourTextField.height = Flour.height
        if(Flour.x == 1024)then
            Flour.x = Flour.x - 1 
            Flour.width = Flour.width-1
            Flour.height = Flour.height - 1
            FlourTextField.x = Flour.x
            FlourTextField.width = Flour.width
            FlourTextField.height = Flour.height
        end
    end
end
local function Milk( touch )
    if(touch.phase == "ended")then
        Milk.x=Milk.x+1
        Milk.width = Milk.width + 1
        Milk.height = Milk.height + 1
        MilkTextField.x = Milk.x
        MilkTextField.width = Milk.width 
        MilkTextField.height = Milk.height
        if(Milk.x == 1024)then
            Milk.x = Milk.x - 1 
            Milk.width = Milk.width-1
            Milk.height = Milk.height - 1
            MilkTextField.x = Milk.x
            MilkTextField.width = Milk.width
            MilkTextField.height = Milk.height
        end
    end
end
local function Salt( touch )
    if(touch.phase == "ended")then
        Salt.x=Salt.x+1
        Salt.width = Salt.width + 1
        Salt.height = Salt.height + 1
        SaltTextField.x = Salt.x
        SaltTextField.width = Salt.width 
        SaltTextField.height = Salt.height
        if(Salt.x == 1024)then
            Salt.x = Salt.x - 1 
            Salt.width = Salt.width-1
            Salt.height = Salt.height - 1
            SaltTextField.x = Salt.x
            SaltTextField.width = Salt.width
            SaltTextField.height = Salt.height
        end
    end
end
local function Sugar( touch )
    if(touch.phase == "ended")then
        Sugar.x=Sugar.x+1
        Sugar.width = Sugar.width + 1
        Sugar.height = Sugar.height + 1
        SugarTextField.x = Sugar.x
        SugarTextField.width = Sugar.width 
        SugarTextField.height = Sugar.height
        if(Sugar.x == 1024)then
            Sugar.x = Sugar.x - 1 
            Sugar.width = Sugar.width-1
            Sugar.height = Sugar.height - 1
            SugarTextField.x = Sugar.x
            SugarTextField.width = Sugar.width
            SugarTextField.height = Sugar.height
        end
    end
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
    FlourTextField = native.newTextField(845, 110, 30, 35)
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
        BakingPowder1:addEventListener("touch", BakingPowder)
        BakingPowder1TextField:addEventListener("touch", BakingPowder)
        BakingPowder2:addEventListener("touch", BakingPowder)
        BakingPowder2TextField:addEventListener("touch", BakingPowder)
        BakingSoda1:addEventListener("touch", BakingSoda)
        BakingSoda1TextField:addEventListener("touch", BakingSoda)
        BakingSoda2:addEventListener("touch", BakingSoda)
        BakingSoda2TextField:addEventListener("touch", BakingSoda)
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
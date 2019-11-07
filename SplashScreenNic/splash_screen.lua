--------------------------------------------------------------------------------------
--
--splash_Sreen.lua
--Created by Nic Riscalas
--Date Nov, 04, 2019
--Description:This is the splash sceen of my CPT

-----------------------------------------------------------------------------------------
--
-- splash_screen.lua
-- Created by: Your Name
-- Date: Month Day, Year
-- Description: This is the splash screen of the game. It displays the 
-- company logo that...
-----------------------------------------------------------------------------------------

-- Use Composer Library
local composer = require( "composer" )

-- Name the Scene
sceneName = "splash_screen"

-----------------------------------------------------------------------------------------

-- Create Scene Object
local scene = composer.newScene( sceneName )

----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------
 
-- The local variables for this scene
local bkg
local frenchdoor1
local frenchdoor2
local scrollXSpeed = 2
local scrollYSpeed = -3
local doorsound = audio.loadSound("sounds/door sounds.mp3")
local doorsoundChannel
local scale=0.0000001
--------------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
--------------------------------------------------------------------------------------------
local function changescale(event)
    scale=scale+0.002
    if (scale>0.1010001)then
        bkg = display.setDefault("background", 255, 233, 0)
    end
end
local function opendoors(event)
    frenchdoor1.width=frenchdoor1.width-scale
    frenchdoor2.width=frenchdoor2.width-scale
end
-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -- set the background to be black
   bkg = display.setDefault("background", 255,223,1)

    -- Insert the frenchdoor1 image
    frenchdoor1 = display.newImageRect("Images/CompanyLogoNicR.png", 2048/2, 1536/2)
    -- anchor Y
    frenchdoor1.anchorY=0
    frenchdoor1.anchorX=0
    --set the width to be half of the contentWidth
    frenchdoor1.width=display.contentWidth/2
    -- Insert objects into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( frenchdoor1 )
    -- Insert the frenchdoor2 image
    frenchdoor2 = display.newImageRect("Images/CompanyLogoNicR2.png", 0,1536/2)
    -- anchor the Y to be 0
    frenchdoor2.anchorY=0
    frenchdoor2.anchorX=1
    --set the initial x and y
    frenchdoor2.x=2045/2
    --set the width to be half of the contentWidth
    frenchdoor2.width=display.contentWidth/2
    -- Insert objects into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( frenchdoor2 )
end -- function scene:create( event )
--------------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    local phase = event.phase

    -----------------------------------------------------------------------------------------

    -- Called when the scene is still off screen (but is about to come on screen).
    if ( phase == "will" ) then
       
    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- start the splash screen music
        doorsoundchannel = audio.play(doorsound )

        -- Go to the main menu screen after the given time.
        timer.performWithDelay ( 3000, gotoMainMenu)          
        
    end

end --function scene:show( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to leave the screen
function scene:hide( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    local phase = event.phase

    -----------------------------------------------------------------------------------------

    -- Called when the scene is on screen (but is about to go off screen).
    -- Insert code here to "pause" the scene.
    -- Example: stop timers, stop animation, stop audio, etc.
    if ( phase == "will" ) then  

    -----------------------------------------------------------------------------------------

    -- Called immediately after scene goes off screen.
    elseif ( phase == "did" ) then
        
        -- stop the jungle sounds channel for this screen
        audio.stop(jungleSoundsChannel)
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
Runtime:addEventListener("enterFrame", opendoors)
Runtime:addEventListener("enterFrame", changescale)
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-----------------------------------------------------------------------------------------

return scene
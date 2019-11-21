
-----------------------------------------------------------------------------------------
--
-- main_menu.lua
-- Created by: Your Name
-- Date: Month Day, Year
-- Description: This is the main menu, displaying the credits, instructions & play buttons.
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
-- INITIALIZATIONS
-----------------------------------------------------------------------------------------

-- Use Composer Library
local composer = require( "composer" )

-----------------------------------------------------------------------------------------

-- Use Widget Library
local widget = require( "widget" )

-----------------------------------------------------------------------------------------

-- Naming Scene
sceneName = "mainmenu"

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

local bkg
local playButton
local creditsButton
local instructionsButton
local volumeButton
local volumeButton3
----------------------------------------------------------------------------------------
--LOCAL SOUNDS
----------------------------------------------------------------------------------------
local backgroundsound = audio.loadSound("Sounds/bkgmusic.mp3")
local backgroundsoundchannel
-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------

local function playMusic( )
    -- Play playMusic
    audio.resume(backgroundsoundchannel)
    volumeButton = display.newImageRect("images/volume button.png", 200,200)
    volumeButton.x=display.contentWidth*6/12
    volumeButton.y=display.contentHeight*1/10
    volumeButton3.isVisible=false
    volumeButton.isVisible=false
    volumeButton4()
end

-- Creating Transition Function to Credits Page
local function CreditsTransition( )       
    composer.gotoScene( "credits_screen", {effect = "zoomOutInRotate", time = 500})
end 

-----------------------------------------------------------------------------------------

-- Creating Transition to Level1 Screen
local function Level1ScreenTransition( )
    composer.gotoScene( "level1_screen", {effect = "slideLeft", time = 1000})
end    
-------------------------------------------------------------------------------------------
--creating transition to instructions screen 
local function InstructionsTransition( )
    composer.gotoScene( "instructions", {effect = "zoomOutInRotate", time = 1000})
end
local function pauseMusic()
    -- Pause the pauseMusic
    audio.pause(backgroundsoundchannel)
    volumeButton2 = display.newImageRect("images/volume button.png", 200,200)
    volumeButton2.x=display.contentWidth*6/12
    volumeButton2.y=display.contentHeight*1/10
    volumeButton.isVisible=false
    volumeButton2.isVisible=false
    volumeButton3()
end
local function pauseMusic2()
    -- Pause the pauseMusic
    audio.pause(backgroundsoundchannel)
    volumeButton2 = display.newImageRect("images/volume button.png", 200,200)
    volumeButton2.x=display.contentWidth*6/12
    volumeButton2.y=display.contentHeight*1/10
    volumeButton.isVisible=false
    volumeButton2.isVisible=false
    volumeButton5()
end
-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------
    -- BACKGROUND IMAGE & STATIC OBJECTS
    -----------------------------------------------------------------------------------------

    -- Insert the background image and set it to the center of the screen
    bkg = display.newImage("Images/MainMenuMoryah.png", 1536/2, 2048/2)
    bkg.x = display.contentCenterX
    bkg.y = display.contentCenterY
    bkg.width = display.contentWidth
    bkg.height = display.contentHeight
    -- Associating display objects with this scene 
    sceneGroup:insert( bkg )

    -- Send the background image to the back layer so all other objects can be on top
    bkg:toBack()

    -----------------------------------------------------------------------------------------
    -- BUTTON WIDGETS
    -----------------------------------------------------------------------------------------   

    -- Creating Play Button
    playButton = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/2,
            y = display.contentHeight*7/8,
            

            -- Insert the images here
            defaultFile = "Images/PlayButtonUnpressedNicR.png",
            overFile = "Images/PlayButtonPressedNicR.png",

            -- When the button is released, call the Level1 screen transition function
            onRelease = Level1ScreenTransition          
        } )

    -----------------------------------------------------------------------------------------

    -- Creating Credits Button
    creditsButton = widget.newButton( 
        {
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth*5/6,
            y = display.contentHeight*9/10,

            -- Insert the images here
            defaultFile = "Images/CreditsButtonUnpressedMoryah@2x.png",
            overFile = "Images/CreditsButtonPressedMoryah@2x.png",

            -- When the button is released, call the Credits transition function
            onRelease = CreditsTransition
        } ) 
  ----------------------------------------------------------------------------------------------  
    instructionsButton = widget.newButton( 
        {
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth*2/12,
            y = display.contentHeight*9/10,

            -- Insert the images here
            defaultFile = "Images/InstructionsButtonUnpressedMoryah.png",
            overFile = "Images/InstructionsButtonPressedMoryah.png",
            -- When the button is released, call the Instructions transition function
            onRelease = InstructionsTransition
        } )

    -----------------------------------------------------------------------------------------
    volumeButton= widget.newButton( 
        {
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth*6/12,
            y = display.contentHeight*1/10,

            -- Insert the images here
            defaultFile = "Images/volume button2.png",
            overFile = "Images/volume button.png",
            -- When the button is released, call the Instructions transition function
            onRelease = pauseMusic
        } )
function volumeButton3( )
            volumeButton3= widget.newButton( 
        {
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth*6/12,
            y = display.contentHeight*1/10,

            -- Insert the images here
            defaultFile = "Images/volume button.png",
            overFile = "Images/volume button2.png",
            -- When the button is released, call the Instructions transition function
            onRelease = playMusic
        } )
     volumeButton3:scale(0.2, 0.2)
     sceneGroup:insert(volumeButton3)
end
  function volumeButton5( )
            volumeButton3= widget.newButton( 
        {
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth*6/12,
            y = display.contentHeight*1/10,

            -- Insert the images here
            defaultFile = "Images/volume button.png",
            overFile = "Images/volume button2.png",
            -- When the button is released, call the Instructions transition function
            onRelease = playMusic
        } )
     volumeButton3:scale(0.2, 0.2)
     sceneGroup:insert(volumeButton3)
end  
function volumeButton4( )
        volumeButton= widget.newButton( 
        {
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth*6/12,
            y = display.contentHeight*1/10,

            -- Insert the images here
            defaultFile = "Images/volume button2.png",
            overFile = "Images/volume button.png",
            -- When the button is released, call the Instructions transition function
            onRelease = pauseMusic2
        } )  
        volumeButton:scale(0.2, 0.2)
        sceneGroup:insert(volumeButton)
end


    -- Associating button widgets with this scene
    sceneGroup:insert( playButton )
    sceneGroup:insert( creditsButton )
    sceneGroup:insert( instructionsButton )    
    playButton:scale(0.9,0.8)
    creditsButton:scale(0.6,0.6)
    instructionsButton:scale(0.6,0.6)
    volumeButton:scale(0.2, 0.2)
end -- function scene:create( event )   



-----------------------------------------------------------------------------------------

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
    backgroundsoundchannel=audio.play(backgroundsound,-1, 5000)
    elseif ( phase == "did" ) then       
        

    end

end -- function scene:show( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to leave the screen
function scene:hide( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

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

end -- function scene:hide( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to be destroyed
function scene:destroy( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

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
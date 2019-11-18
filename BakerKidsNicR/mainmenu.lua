
-----------------------------------------------------------------------------------------
--
-- main_menu.lua
-- Created by: Nic R
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

local bkg_image
local playButton
local creditsButton
local instructionsButton
--------------------------------------------------------------------------------------------
--LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------------
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

-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------
function scene:create( event )

	--Creating a group that associates objects with the scene 
	local sceneGroup = self.view
    -----------------------------------------------------------------------------------------
    -- BACKGROUND IMAGE & STATIC OBJECTS
    -----------------------------------------------------------------------------------------
    --Insert the BACKGROUND image and position it to the center of the screen
    bkg_image = display.newImage("Images/backgroundImage.")
end

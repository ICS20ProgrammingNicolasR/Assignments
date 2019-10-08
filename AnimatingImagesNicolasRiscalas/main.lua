-----------------------------------------------------------------------------------------
--animating images
-- nic riscalas
--ics20
--this programing makes images bounce off the walls of the table and spin and move diagonnally
-----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------
--GLOBAL VARIABLES
-----------------------------------------------------------------------------------------
scrollSpeed=3
-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------
local backgroundImage=display.newImageRect("Images/background.jpg", 2048/2, 1536/2)
backgroundImage.x = display.contentCenterX
backgroundImage.y=display.contentCenterY

local lolimage=display.newImageRect("Images/lol image.png", 200, 200)
lolimage.x=display.contentCenterX
lolimage.y=display.contentCenterY
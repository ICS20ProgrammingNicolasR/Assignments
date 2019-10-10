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

local greenface=display.newImageRect("Images/laughinggreenface.png", 200,200)
greenface.x=display.contentWidth/2
greenface.y=display.contentHeight/5

local leaperd=display.newImageRect("Images/leopard.png",200,200)
leaperd.x=display.contentWidth/4.8
leaperd.y=display.contentHeight/5

local yoshi=display.newImageRect("Images/yoshi.png",200,200)
yoshi.x=display.contentWidth/1.2
yoshi.y=display.contentHeight/5

local walls=display.newImageRect("Images/wall.jpg",0,1536)
walls.x=2048
walls.y=768
-------------------------------------------------------------------------------------------
--LOCAL FUNCTIONS
-------------------------------------------------------------------------------------------
local function greenfacecurve(event)
	-- body
	scrollSpeed=scrollSpeed-0.5
end
local function paraboliccurve(event)
	-- body
	greenface.x = greenface.x+5
	greenface.y=greenface.y-scrollSpeed
end
local function finnishstop(event)
	-- body
	greenface.x=greenface.x-5
	greenface.y=greenface.y+scrollSpeed
end
local function stop(event)
	if (greenface.x<800)then
		paraboliccurve()
	else
		finnishstop()
	end
end
Runtime:addEventListener("enterFrame", stop)
Runtime:addEventListener("enterFrame", paraboliccurve)
Runtime:addEventListener("enterFrame", greenfacecurve)
local function moveyoshi(event)
	-- body
	yoshi.x=yoshi.x-5
end
local function finnishstop2(event)
	yoshi.x=display.contentCenterX
end
local function stop2(event)
	if (yoshi.x<display.contentWidth/1.2)then
		moveyoshi()
	else
		finnishstop2()
	end
end
timer.performWithDelay(1000,stop2)
Runtime:addEventListener("enterFrame", stop2)
Runtime:addEventListener("enterFrame", moveyoshi)

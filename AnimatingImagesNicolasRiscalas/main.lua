-----------------------------------------------------------------------------------------
--animating images
-- nic riscalas
--ics20
--this programing makes images bounce off the walls of the table and spin and move diagonnally
--oct/10/2019
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

local yoshi=display.newImageRect("Images/yoshi.png",200,200)
yoshi.x=display.contentWidth/1.2
yoshi.y=display.contentHeight/5

local leaperd=display.newImageRect("Images/leopard.png",200,200)
leaperd.x=display.contentWidth/4.8
leaperd.y=display.contentHeight/5

local welcometext=display.newText("Hello welcome to my program!", 200, 200,"arial", 60)
welcometext.x=display.contentCenterX
displaytext=display.contentHeight/2

-------------------------------------------------------------------------------------------
--LOCAL FUNCTIONS
-------------------------------------------------------------------------------------------
--set my scroll speed
local function greenfacecurve(event)
	-- body
	scrollSpeed=scrollSpeed-0.5
end
--make the green face curve
local function paraboliccurve(event)
	-- body
	greenface.x = greenface.x+5
	greenface.y=greenface.y-scrollSpeed
end
--stop the curve
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
--move the yoshi
local function moveyoshi(event)
	yoshi.x=yoshi.x-1.5
end
--stop the movement
local function finnishstop2(event)
	yoshi.x=yoshi.x+1.5
end
local function stop2(event)
	if (yoshi.x<512)then
		finnishstop2()
	else
		moveyoshi()
	end
end
Runtime:addEventListener("enterFrame", stop2)
Runtime:addEventListener("enterFrame", moveyoshi)
--grow the leaperd
local function growleapard(event)
	leaperd:scale(1.01,1.01)
end
Runtime:addEventListener("enterFrame", growleapard)
--make the lol image rotate
local function lolimagerotate(event)
	transition.to( lolimage, { rotation = lolimage.rotation-100, onComplete = lolimagerotate } )
end
Runtime:addEventListener("enterFrame", lolimagerotate)
--------------------------------------------------------------------------------------------------------------------------------------
--TEXTCOLOUR
--------------------------------------------------------------------------------------------------------------------------------------
--set the text colour
welcometext:setTextColor(0,1,1)
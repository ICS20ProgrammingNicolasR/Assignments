-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------
--set the background
display.setDefault("background", 50/255, 200/255, 300/255)
--create my variables
local rhombus=display.newPolygon(600, 475, {-200, 300, 200, 300, 100, 0, -300, 0})
local trapezoid=display.newPolygon(600, 300, {-200,300,200,300,100,0,-600,0})
local triangle=display .newPolygon(600, 475, {-200, 300, 200, 400, 100,0})
local pentagon=display.newPolygon(600,475, {-200, 300, 200, 300, 100, 0, -150, -100, -300, 0})
local rhombustext
local trapezoidtext
local pentagontext
local trianglebase=10
local triangleHeight=15
local areaoftriangle=trianglebase*triangleHeight
local triangletext
--set the tansparency to zero 
triangle.alpha=0
trapezoid.alpha=0
pentagon.alpha=0
--display some newText
triangletext=display.newText("This triangle's area is "..trianglebase*triangleHeight)
local function fadeinshapes(event)
	-- body
	rhombus.alpha=rhombus.alpha+0.01
	trapezoid.alpha=trapezoid.alpha+0.01
	triangle.alpha=triangle.alpha+0.01
	pentagon.alpha=pentagon.alpha+0.01
	triangletext.alpha=triangletext.alpha+0.01
	rhombustext.alpha=rhombustext.alpha+0.01
	trapezoidtext.alpha=trapezoidtext.alpha+0.01
	pentagontext.alpha=pentagontext.alpha+0.01
end
Runtime:addEventListener("enterFrame", fadeinshapes)
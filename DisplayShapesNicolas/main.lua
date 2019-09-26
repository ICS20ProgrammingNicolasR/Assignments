-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------
--set the background
display.setDefault("background", 50/255, 200/255, 300/255)
--create my variables
local rhombus=display.newPolygon(600, 475, {-200, 300, 200, 300, 100, 0, -300, 0})
local trapezoid=display.newPolygon(600, 475, {-200,300,200,300,100,0,-600,0})
local triangle=display .newPolygon(600, 475, {-200, 300, 200, 400, 100,0})
local pentagon=display.newPolygon(600,475, {-200, 300, 200, 300, 100, 0, -150, -100, -300, 0})
local triangletext
local trianglebase=10
local triangleHeight=15
local areaoftriangle=trianglebase*triangleHeight
--set the tansparency to zero 
triangle.alpha=0
trapezoid.alpha=0
pentagon.alpha=0
--make the rombus fade out
function Fadeout(event)
	-- body
	rhombus.alpha=rhombus.alpha-0.001
end

Runtime:addEventListener("enterFrame", Fadeout)

--make the triangle fade in after .5 of a second
function Fadein(event)
	-- body
	triangle.alpha=triangle.alpha+0.01
	timer.performWithDelay( 500, Fadein)
end
Runtime:addEventListener("enterFrame", Fadein) 

--make the trangle have a colour and a border
triangle.strokeWidth=20
triangle:setStrokeColor(0.5,0,1)
triangle:setFillColor(0,1,0)

--say the area
triangletext=display.newText("The area of the triangle with the base of  \n"..
	trianglebase.." cm and a height of  "..triangleHeight.. " cm is "..areaoftriangle.." cm².",570,700, Arial, 50)

--make the triangle fade out after 2 seconds
function FadeoutTriangle(event)
	-- body
	triangletext.alpha=1
	triangle.alpha=triangle.alpha-0.001
	triangletext.alpha=triangletext.alpha-0.1
	timer.performWithDelay( 2500, FadeoutTriangle)

end

Runtime:addEventListener("enterFrame", FadeoutTriangle)

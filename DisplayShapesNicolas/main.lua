-----------------------------------------------------------------------------------------
--
-- main.lua
--
--this program has many shapes that ccan be moved by pressing and holding
--set the background
display.setDefault("background", 50/255, 200/255, 300/255)
--create my variables
local rhombus=display.newPolygon(700, 500, {100, 100, 500, 100, 400, -50, 0, -50})
local trapezoid=display.newPolygon(700, 200, {-200,300,200,300,100,0,-400,0})
local triangle=display .newPolygon(200, 600, {-200, 300, 200, 300, 150,0})
local pentagon=display.newPolygon(300,200, {-200, 300, 200, 300, 50, 0, -150, -100, -300, 0})
local rhombustext=display.newText("parellelogram",700,600, Arial, 50)
local trapezoidtext=display.newText("trapezoid",700,375,Arial,50)
local pentagontext=display.newText("pentagon", 300,430,Arial,50)
local areaoftriangle=10*15
local triangletext=display.newText("The area of this triangle that \n"..
	"has a height of 10 cm and a base of 15 is 75cm²(you can move all shapes by \n"..
	"just pressing and holding",500,400,Arial,25)
--set the x/y values
triangle.x=200
triangle.y=600
rhombus.x=700
rhombus.y=500
trapezoid.x=700
trapezoid.y=200
pentagon.x=300
pentagon.y=200
--set the tansparency to zero 
triangle.alpha=0
trapezoid.alpha=0
pentagon.alpha=0
rhombus.alpha=0
rhombustext.alpha=0
trapezoidtext.alpha=0
pentagontext.alpha=0
triangletext.alpha=0
--set the colours
rhombus:setFillColor(200/255,30/255,100/255)
triangle:setFillColor(40/255,200/255,100/255)
pentagon:setFillColor(200/255,200/255,50/255)
trapezoid:setFillColor(100/255,100/255, 255/255)
pentagontext:setFillColor(200/255, 200/255, 50/255)
triangletext:setFillColor(40/255,255/255,100/255)
rhombustext:setFillColor(200/255,30/255,100/255)
trapezoidtext:setFillColor(100/255,100/255,255/255)
--create boolean variables for shapes 
local alreadytouchedtriangle=false
local alreadytouchedrhombus=false
local alreadytouchedpentagon=false
local alreadytouchedtrapezoid=false
--fade in the shapes and the text
local function fadeintriangle(event)
	triangle.alpha=triangle.alpha+0.01
	triangletext.alpha=triangletext.alpha+0.01
end
Runtime:addEventListener("enterFrame", fadeintriangle)

local function dragtriangle(touch)
	
	if(touch.phase=="began")then
		alreadytouchedtriangle=true
	end
	if ((touch.phase=="moved")and(alreadytouchedtriangle==true))then
		triangle.x=touch.x
		triangle.y=touch.y
	end
	if(touch.phase=="ended")then
		local function fadeouttriangle(event)
		triangle.alpha=triangle.alpha-0.01
		triangletext.alpha=triangle.alpha
		timer.performWithDelay(1000,fadeouttriangleandfadeinrhombus)
		rhombus.alpha=rhombus.alpha+0.01
		rhombustext.alpha=rhombustext.alpha+0.01
 		end
 		Runtime:addEventListener("enterFrame",fadeouttriangle)
 	end
end	
triangle:addEventListener("touch", dragtriangle)
local function dragrhombus(touch)
	if (touch.phase=="began")then
		alreadytouchedrhombus=true
	end
	if((touch.phase=="moved")and(alreadytouchedrhombus==true))then
		rhombus.x=touch.x
		rhombus.y=touch.y
	end
	if(touch.phase=="ended")then
		local function fadeoutrhombusandfadeinpentagon(event)
			rhombus.alpha=rhombus.alpha-0.01
			rhombustext.alpha=rhombustext.alpha-0.01
			pentagon.alpha=pentagon.alpha+0.01
			pentagontext.alpha=pentagontext.alpha+0.01
			timer.performWithDelay(1000,fadeoutrhombusandfadeinpentagon)
		end
		Runtime:addEventListener("enterFrame",fadeoutrhombusandfadeinpentagon)
	end
end
rhombus:addEventListener("touch", dragrhombus)
local function dragpentagon(touch)
	if (touch.phase=="began")then
		alreadytouchedpentagon=true
	end
	if((touch.phase=="moved")and(alreadytouchedpentagon==true))then
		pentagon.x=touch.x
		pentagon.y=touch.y
	end
	if(touch.phase=="ended")then
		local function fadeoutpentagonandfadeintrapezoid(event)
			pentagon.alpha=pentagon.alpha-0.01
			pentagontext.alpha=pentagontext.alpha-0.01
			trapezoid.alpha=trapezoid.alpha+0.01
			trapezoidtext.alpha=trapezoidtext.alpha+0.01
			timer.performWithDelay(200,fadeoutpentagonandfadeintrapezoid)
		end
		Runtime:addEventListener("enterFrame",fadeoutpentagonandfadeintrapezoid)
	end
end
pentagon:addEventListener("touch", dragpentagon)
local function dragtrapezoid(touch)
	if (touch.phase=="began")then
		alreadytouchedtrapezoid=true
	end
	if((touch.phase=="moved")and(alreadytouchedtrapezoid==true))then
		trapezoid.x=touch.x
		trapezoid.y=touch.y
	end
	if(touch.phase=="ended")then
		local function fadeinshapes(event)
			triangle.alpha=1
			triangletext.alpha=0
			pentagon.alpha=1
			pentagontext.alpha=0
			rhombus.alpha=1
			rhombustext.alpha=0
			trapezoidtext.alpha=0
			triangle.x=200
			triangle.y=600
			rhombus.x=700
			rhombus.y=500
			trapezoid.x=700
			trapezoid.y=200
			pentagon.x=300
			pentagon.y=200
			timer.performWithDelay(200,fadeinshapes)			
		end
		Runtime:addEventListener("enterFrame",fadeinshapes)
	end
end
trapezoid:addEventListener("touch", dragtrapezoid)

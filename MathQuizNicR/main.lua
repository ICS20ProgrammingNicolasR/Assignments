-- Title: NumericTextFields
-- Name: Your Name
-- Course: ICS2O/3C
-- This programdisplays a math question and asks the user to answer in a numeric textfield
-----------------------------------------------------------------------------------------

--set the background colour
local bkg=display.newImageRect("Images/johnny rad lounge.jpg", 2048/2, 1536/2)
bkg.anchorX=0
bkg.anchorY=0
local youlostImage=display.newImageRect("Images/you lost.jpg", 2048/2, 1536/2)
youlostImage.isVisible=false
youlostImage.anchorX=0
youlostImage.anchorY=0
local youwonimage=display.newImageRect("Images/you won.jpg",2048/2,1536/2)
youwonimage.isVisible=false
youwonimage.anchorX=0
youwonimage.anchorY=0
------------------------------------------------------------------------------------------
--audio
------------------------------------------------------------------------------------------
local backgroundSound= audio.loadSound("sounds/skateboard-shuffle.mp3")
audio.play(backgroundSound, {loops = -1})

------------------------------------------------------------------------------------------
--local variables
------------------------------------------------------------------------------------------

--create local variables 
local questionObject
local correctObject 
local numericField
local randomNumber1
local randomNumber2
local randomNumber6
local randomNumber7
local userAnswer
local correctAnswer
local textObject
local points=0
local lives=4
local randomNumber3 
local randomNumber4 
local randomNumber5
local newimage
--variables for timer
local totalseconds=10
local secondsleft=10
local clockText 
local countDownTimer
local heart1
local heart2
local heart3
local heart4
--------------------------------------------------------------------------------------------
--SOUNDS
--------------------------------------------------------------------------------------------

--Icorrect sound 
local incorrectsound=audio.loadSound( "sounds/wrong buzzer.wav")
local incorrectsoundchannel

--correct sound 
correctsound=audio.loadSound("sounds/correct sound.wav")
local correctsoundchannel
--------------------------------------------------------------------------------------------
--local functions
--------------------------------------------------------------------------------------------

local function AskQuestion()
	--generate a random number between 1-4
	randomOperator=math.random(1,7)

	-- generate 2 random numbers between a max. and a min. number
	randomNumber1=math.random(0,10)
	randomNumber2=math.random(0,10)

	--if the randomOperator==1 then do adition
	if(randomOperator==1)then
		correctAnswer=randomNumber1+randomNumber2

	--create question in text Object
	questionObject.text=randomNumber1.." + "..randomNumber2.." = "
	--if it is 2 do subtraction
	elseif(randomOperator==2)then
		correctAnswer=randomNumber1-randomNumber2
		--create question in textObject
		questionObject.text=randomNumber1.." - "..randomNumber2.." = "
		if (randomNumber1<randomNumber2)then
			correctAnswer=randomNumber2-randomNumber1
			questionObject.text=randomNumber2.." - "..randomNumber1.." = "
		end
	elseif(randomOperator==3)then
		correctAnswer=randomNumber1*randomNumber2
		questionObject.text=randomNumber1.." x "..randomNumber2.." = "
	elseif(randomOperator==4)then
		randomNumber4=math.random(0,10)
		randomNumber3=math.random(0,10)
		randomNumber5=randomNumber4*randomNumber3
		correctAnswer=randomNumber5/randomNumber4
		questionObject.text=randomNumber5 .. " / "..randomNumber4.." = "
	elseif(randomOperator==5)then
		-- defines a factorial function
		randomNumber2=math.random(1,5)
		if(randomNumber2==1)then
			correctAnswer=randomNumber2
		elseif(randomNumber2==2)then
			correctAnswer=randomNumber2*(randomNumber2-1)
		elseif(randomNumber2==3)then
			correctAnswer=randomNumber2*(randomNumber2-1)*(randomNumber2-2)
		elseif(randomNumber2==4)then
			correctAnswer=randomNumber2*(randomNumber2-1)*(randomNumber2-2)*(randomNumber2-3)
		elseif(randomNumber2==5)then
			correctAnswer=randomNumber2*(randomNumber2-1)*(randomNumber2-2)*(randomNumber2-3)*(randomNumber2-4)
		end
		questionObject.text=randomNumber2.." ! "
	elseif(randomOperator==6)then
		randomNumber1=math.random(1,10)
		randomNumber6=randomNumber1*randomNumber1
		correctAnswer=randomNumber6/randomNumber1
		questionObject.text=" √ "..randomNumber6.." = "
	elseif(randomOperator==7)then
		randomNumber1=math.random(1,10)
		randomNumber7=randomNumber1*randomNumber1*randomNumber1
		correctAnswer=randomNumber7/(randomNumber1*randomNumber1)
		questionObject.text=" ∛ "..randomNumber7.." = "
	end
end

local function HideCorect()	
	correctObject.isVisible=false
	textObject.isVisible=false
	AskQuestion()
end
local function NumericFieldListener(event)
	-- User begins editing "numericField"
	if (event.phase=="began")then

		--clear text field 
		event.target.text=""

	elseif(event.phase=="submitted")then
		--when the answer is submitted (enter key is pressed) set user input to user's answer
		userAnswer=tonumber(event.target.text)

		--if the users answer and the correct answer are the same:
		if (userAnswer==correctAnswer)then
			correctObject.isVisible=true 
			correctsoundchannel=audio.play(correctsound)
			timer.performWithDelay(2000,HideCorrect)
			AskQuestion()
			secondsleft=totalseconds
			textObject.isVisible=false
			--give one point
			points=points+1
			--update it in display object
			pointsText.text="points = "..points
			if(points==5)then
				questionObject.isVisible=false
				correctObject.isVisible=false
				numericField.isVisible=false
				pointsText.isVisible=false
				textObject.isVisible=false
				youwonimage.isVisible=true
			end			
		else
			if (lives==4)then
			heart4.isVisible=false
			elseif(lives==3)then
				heart3.isVisible=false
			elseif(lives==2) then
				heart2.isVisible=false
			elseif(lives==1)then
				heart1.isVisible=false
			end
			textObject.isVisible=true
			incorrectsoundchannel=audio.play(incorrectsound)
			textObject.text=("That is incorrect:(.You lose one life.\n".."The correct answer is "..correctAnswer)
			timer.performWithDelay(2000,HideCorrect)
			AskQuestion()
			secondsleft=totalseconds
			correctObject.isVisible=false
			lives=lives-1
			if(lives==0)then
				if(clockText.isVisible==true)then			
					questionObject.isVisible=false
					correctObject.isVisible=false
					numericField.isVisible=false
					textObject.isVisible=false
					pointsText.isVisible=false
					youlostImage.isVisible=true
					local badimage=display.newImageRect("Images/you lost.jpg",2048/2,1536/2)
					badimage.anchorX=0
					badimage.anchorY=0
					timer.performWithDelay(1000)
				end
			end
		end 
		--clear text field 
		event.target.text=""

	end
end

local function Updatetime()
	-- decrement the number of seconds
	secondsleft=secondsleft-1

	--display the number of seconds in a clock 
	clockText.text=secondsleft..""
	if(secondsleft==0) then
		secondsleft=totalseconds
		textObject.isVisible=true
		textObject.text=("You ran out of time :(.You lose one life.\n".."The correct answer is "..correctAnswer)
		lives=lives-1
		if (lives==4)then
			heart4.isVisible=false
		elseif(lives==3)then
			heart3.isVisible=false
		elseif(lives==2) then
			heart2.isVisible=false
		elseif(lives==1)then
			heart1.isVisible=false
		else
			questionObject.isVisible=false
			correctObject.isVisible=false
			numericField.isVisible=false
			textObject.isVisible=false
			pointsText.isVisible=false
			youlostImage.isVisible=true
			timer.performWithDelay(1000)
		end
	end
end

--call the timer
local function StartTimer()
	-- create a countDown Timer that loops infinitely
	countDownTimer=timer.performWithDelay( 1000, Updatetime, 0)
end
StartTimer()
------------------------------------------------------------------------------------------------
-- Object Ceation
------------------------------------------------------------------------------------------------

--create the lives
heart1=display.newImageRect("Images/heart.png", 100, 100)
heart1.x=display.contentWidth*9/11
heart1.y=display.contentHeight*1/7

heart2=display.newImageRect("Images/heart.png", 100, 100)
heart2.x=display.contentWidth*8/11
heart2.y=display.contentHeight*1/7

heart3=display.newImageRect("Images/heart.png", 100, 100)
heart3.x=display.contentWidth*7/11
heart3.y=display.contentHeight*1/7

heart4=display.newImageRect("Images/heart.png", 100, 100)
heart4.x=display.contentWidth*10/11
heart4.y=display.contentHeight*1/7
-- display a question and sets the colour 
questionObject=display.newText("", display.contentWidth/4,display.contentHeight/2,nil,50)
questionObject:setTextColor(255/255, 2/255, 198/255)

--create the correct text object and make it invisible 
correctObject=display.newText("That's rad dude.You gain a point! Good Job:)", display.contentWidth/2, display.contentHeight*2/3,nil,50)
correctObject:setTextColor(255/255, 42/255, 198/255)
correctObject.isVisible=false
--create the incorrect text objecti
textObject=display.newText("That is incorrect:(.You lose one life.\n".."The correct answer is ",display.contentWidth/2,display.contentHeight*2/3,nil,50)
textObject.isVisible=false
--create a numeric field
numericField=native.newTextField(display.contentWidth/2, display.contentHeight/2, 150,80)
numericField.inputType="number"

--add the event listener for the numeric field
numericField:addEventListener("userInput", NumericFieldListener)
textObject.isVisible=false
textObject:setTextColor(255/255, 2/255, 198/255)
pointsText = display.newText("Points ="..points, display.contentWidth/3,display.contentHeight/3,nil,50)

clockText=display.newText("seconds left = 10", display.contentWidth/3, display.contentHeight/5, nil, 50)
clockText:setTextColor(255/255, 2/255, 198/255)
clockText.isVisible=true
youwonimage = display.newImageRect("Images/you won.jpg",2048/2,1536/2)
youwonimage.isVisible=false
youwonimage.anchorX=0
youwonimage.anchorY=0
youlostimage=display.newImageRect("Images/you lost.jpg",2048/2,1536/2)
youlostimage.anchorX=0
youlostimage.anchorY=0
youlostimage.isVisible=false
--------------------------------------------------------------------------------------------------
--function calls
--------------------------------------------------------------------------------------------------

--call the function to ask the question
AskQuestion()
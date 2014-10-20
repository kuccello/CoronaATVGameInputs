
local offsetX = 100
local offsetY = 50

local controller1 = display.newImageRect( "Controller.jpg", 480, 298 )
local controller2 = display.newImageRect( "Controller.jpg", 480, 298 )
local controller3 = display.newImageRect( "Controller.jpg", 480, 298 )
local controller4 = display.newImageRect( "Controller.jpg", 480, 298 )

local ctrl1_Y = {x=408,y=165}
local ctrl2_Y = {x=893,y=165}
local ctrl3_Y = {x=408,y=471}
local ctrl4_Y = {x=893,y=471}

local ctrl1_X = {x=372,y=203}
local ctrl2_X = {x=856,y=203}
local ctrl3_X = {x=372,y=509}
local ctrl4_X = {x=856,y=509}

local ctrl1_A = {x=408,y=242}
local ctrl2_A = {x=893,y=242}
local ctrl3_A = {x=408,y=548}
local ctrl4_A = {x=893,y=548}

local ctrl1_B = {x=445,y=203}
local ctrl2_B = {x=930,y=203}
local ctrl3_B = {x=445,y=509}
local ctrl4_B = {x=930,y=509}

local ctrl_1_state = {a=false,b=false,x=false,y=false,lb=false,rb=false,lsb=false,rsb=false}
local ctrl_1_visual = {
	a=display.newImageRect( "RedButton.png", 34, 34 ),
	b=display.newImageRect( "RedButton.png", 34, 34 ),
	x=display.newImageRect( "RedButton.png", 34, 34 ),
	y=display.newImageRect( "RedButton.png", 34, 34 ),
}
ctrl_1_visual.a:translate( ctrl1_A.x + offsetX, ctrl1_A.y  + offsetY)
ctrl_1_visual.a.isVisible = ctrl_1_state.a
ctrl_1_visual.b:translate( ctrl1_B.x + offsetX, ctrl1_B.y  + offsetY)
ctrl_1_visual.b.isVisible = ctrl_1_state.b
ctrl_1_visual.x:translate( ctrl1_X.x + offsetX, ctrl1_X.y  + offsetY)
ctrl_1_visual.x.isVisible = ctrl_1_state.x
ctrl_1_visual.y:translate( ctrl1_Y.x + offsetX, ctrl1_Y.y  + offsetY)
ctrl_1_visual.y.isVisible = ctrl_1_state.y

local ctrl_2_state = {a=false,b=false,x=false,y=false,lb=false,rb=false,lsb=false,rsb=false}
local ctrl_2_visual = {
	a=display.newImageRect( "RedButton.png", 34, 34 ),
	b=display.newImageRect( "RedButton.png", 34, 34 ),
	x=display.newImageRect( "RedButton.png", 34, 34 ),
	y=display.newImageRect( "RedButton.png", 34, 34 ),
}
ctrl_2_visual.a:translate( ctrl2_A.x + offsetX, ctrl2_A.y  + offsetY)
ctrl_2_visual.a.isVisible = ctrl_2_state.a
ctrl_2_visual.b:translate( ctrl2_B.x + offsetX, ctrl2_B.y  + offsetY)
ctrl_2_visual.b.isVisible = ctrl_2_state.b
ctrl_2_visual.x:translate( ctrl2_X.x + offsetX, ctrl2_X.y  + offsetY)
ctrl_2_visual.x.isVisible = ctrl_2_state.x
ctrl_2_visual.y:translate( ctrl2_Y.x + offsetX, ctrl2_Y.y  + offsetY)
ctrl_2_visual.y.isVisible = ctrl_2_state.y

-- reuse this by translating it as needed
-- local redButton1_a = display.newImageRect( "RedButton.png", 34, 34 )
-- redButton1_a:translate( ctrl1_Y.x + offsetX, ctrl1_Y.y + offsetY)
-- redButton1_a.isVisible = false


-- myDynamicImage:translate(display.contentCenterX,display.contentCenterY)

controller1:translate(245 + offsetX,154 + offsetY)
controller2:translate(730 + offsetX,154 + offsetY)
controller3:translate(245 + offsetX,460 + offsetY)
controller4:translate(730 + offsetX,460 + offsetY)

-- local myTextObject = display.newText("PAYLOAD", display.contentCenterX, display.contentHeight - 180, native.systemFont, 30)
-- myTextObject.text = "Hello"

local player1 = display.newText("Player 1", 245 + offsetX,80 + offsetY, native.systemFont, 40)
player1:setFillColor( 0.8, 0, 0 )

local player2 = display.newText("Player 2", 730 + offsetX,80 + offsetY, native.systemFont, 40)
player2:setFillColor( 0.8, 0, 0 )

local player3 = display.newText("Player 3", 245 + offsetX,390 + offsetY, native.systemFont, 40)
player3:setFillColor( 0.8, 0, 0 )

local player4 = display.newText("Player 4", 730 + offsetX,390 + offsetY, native.systemFont, 40)
player4:setFillColor( 0.8, 0, 0 )




print("Content Width   : ", display.contentWidth)
print("Content Height  : ", display.contentHeight)
print("Pixel Width     : ", display.pixelWidth)
print("Pixel Height    : ", display.pixelHeight)
print("Viewable Width  : ", display.viewableContentWidth)
print("Viewable Height : ", display.viewableContentHeight)
print("Center X        : ", display.contentCenterX)
print("Center Y        : ", display.contentCenterY)

function myUnhandledErrorListener( event )

    local iHandledTheError = true

    if ( iHandledTheError ) then
        print( "Handling the unhandled error", event.errorMessage )
    else
        print( "Not handling the unhandled error", event.errorMessage )
    end

    return iHandledTheError
end

Runtime:addEventListener( "unhandledError", myUnhandledErrorListener )

local function onAxisEvent( event )
	print("------ EVENT PAYLOAD ---------")
	print("EVENT NAME: ", event.name)
	print("DEVICE DESCRIPTOR:", event.device.descriptor)
	print("DEVICE DISPLAY NAME:", event.device.displayName)
	print("DEVICE ANDROID ID:", event.device.androidDeviceId)
	print("DEVICE AXES:", event.device:getAxes())
	print("AXIS NUMBER: ", event.axis.number)
	print("Normalized Value: ", tostring(event.normalizedValue))
	print("Raw Value: ", tostring(event.rawValue))


	-- myTextObject.text = "Payload\n".."EVENT NAME: "..event.name.."\nDEVICE DESCRIPTOR:"..event.device.descriptor.."\nDEVICE DISPLAY NAME:"..event.device.displayName.."\nDEVICE ANDROID ID:"..event.device.androidDeviceId.."\nNormalized Value: "..tostring(event.normalizedValue)
end

-- Called when a key event has been received.
local function onKeyEvent( event )
	print(event.keyName, "(", event.phase, ")")
	print("DEVICE DESCRIPTOR:", event.device.descriptor)
	print("DEVICE DISPLAY NAME:", event.device.displayName)
	print("DEVICE ANDROID ID:", event.device.androidDeviceId)

	local ctrl_index = 0
	if (event.device.descriptor == "Joystick 1") then
		ctrl_index = 1
		if(event.keyName == "buttonA") then
			ctrl_1_state.a = (event.phase == "down")
			ctrl_1_visual.a.isVisible = ctrl_1_state.a
		end
		if(event.keyName == "buttonB") then
			ctrl_1_state.b = (event.phase == "down")
			ctrl_1_visual.b.isVisible = ctrl_1_state.b
		end
		if(event.keyName == "buttonX") then
			ctrl_1_state.x = (event.phase == "down")
			ctrl_1_visual.x.isVisible = ctrl_1_state.x
		end
		if(event.keyName == "buttonY") then
			ctrl_1_state.y = (event.phase == "down")
			ctrl_1_visual.y.isVisible = ctrl_1_state.y
		end
	end
	if (event.device.descriptor == "Joystick 2") then
		ctrl_index = 2
		if(event.keyName == "buttonA") then
			ctrl_2_state.a = (event.phase == "down")
			ctrl_2_visual.a.isVisible = ctrl_2_state.a
		end
		if(event.keyName == "buttonB") then
			ctrl_2_state.b = (event.phase == "down")
			ctrl_2_visual.b.isVisible = ctrl_2_state.b
		end
		if(event.keyName == "buttonX") then
			ctrl_2_state.x = (event.phase == "down")
			ctrl_2_visual.x.isVisible = ctrl_2_state.x
		end
		if(event.keyName == "buttonY") then
			ctrl_2_state.y = (event.phase == "down")
			ctrl_2_visual.y.isVisible = ctrl_2_state.y
		end
	end
	if (event.device.descriptor == "Joystick 3") then
		ctrl_index = 3
	end
	if (event.device.descriptor == "Joystick 4") then
		ctrl_index = 4
	end



	-- if (event.keyName == "down") then
	-- 	print("DOWN")
	-- end
 --    if (event.keyName == "left") then
 --    	print("LEFT")
 --    end
 --    if (event.keyName == "right") then
 --    	print("RIGHT")
 --    end
 --    if (event.keyName == "up") then
 --    	print("UP")
 --    end
 --    if (event.keyName == "leftJoystickButton") then
 --    	print("LEFT STICK BUTTON")
 --    end
 -- 	if (event.keyName == "rightJoystickButton") then
 -- 		print("RIGHT STICK BUTTON")
    -- end
end

-- Add the axis event listener.
Runtime:addEventListener( "axis", onAxisEvent )

-- Add the key event listener.
Runtime:addEventListener( "key", onKeyEvent )

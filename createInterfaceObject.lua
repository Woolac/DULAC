return function(a1)
	if not a1 then return end
	
	local objectType = a1[1]
	local objectParent = a1[2]
	local objectPosition = a1[3]
	local objectSize = a1[4]
	local objectColor = a1[5]
	local objectBevelAmount = a1[6]
	local objectName = a1[7]
	local isOuterLayer = a1[8]
	
	local newObject = Instance.new(objectType,objectParent)
	

	newObject.Name = objectName
	newObject.AnchorPoint = Vector2.new(.5,.5)
	newObject.Position = objectPosition
	newObject.Size = objectSize
	
	
	if objectType ~= "TextLabel" then
		local newBevel = Instance.new("UICorner",newObject)
		newBevel.CornerRadius = UDim.new(objectBevelAmount,0)		
	end
	
	if objectType == "Frame" then
		newObject.BackgroundColor3 = objectColor
	end
	
	if objectType == "TextLabel" then
		newObject.BackgroundTransparency = 1
		newObject.TextColor3 = objectColor
		newObject.TextScaled = true
		
		if a1[9] then
			local labelData = a1[9]
			
			newObject.Front = labelData[1]
			newObject.Text = labelData[2]
		end
	end
	
	if isOuterLayer then
		local newStroke = Instance.new("UIStroke",newObject)
		newStroke.Thickness = 2.7
		newStroke.Color = Color3.fromRGB(255, 255, 255)
	end
	
	return newObject
end

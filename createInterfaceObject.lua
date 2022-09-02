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
	
	
	if objectBevelAmount then
		local newBevel = Instance.new("UICorner",newObject)
		newBevel.CornerRadius = UDim.new(objectBevelAmount,0)		
	end
	
	if objectType == "Frame" then
		newObject.BackgroundColor3 = objectColor
	end
	
	if objectType == "ImageLabel" then
		newObject.BackgroundTransparency = 1
		newObject.ImageColor3 = objectColor
		if not a1[9] then return end
		newObject.Image = a1[9]
	end
	
	if objectType == "ScrollingFrame" then
		newObject.BackgroundTransparency = 1
		newObject.ScrollBarImageTransparency = 1
		newObject.ScrollBarThickness = 5
		if not a1[9] then return end
		local objectData = a1[9]
		local newUIList = Instance.new("UIListLayout",newObject)
		
		newUIList.HorizontalAlignment = Enum.HorizontalAlignment.Center
		newUIList.Padding = UDim.new(objectData[2],0)
		newUIList.SortOrder = "LayoutOrder"
		
		
		newObject.CanvasSize = objectData[1]
	end
	
	if objectType == "TextBox" then
		newObject.BackgroundTransparency = 1 
		newObject.PlaceholderColor3 = Color3.fromRGB(163, 163, 163)
		newObject.TextColor3 = Color3.fromRGB(255, 255, 255)

		if a1[9] then
			local labelData = a1[9]

			newObject.Font = labelData[1]
			newObject.PlaceholderText = labelData[2]
			newObject.TextScaled = true
			newObject.TextXAlignment = "Left"
		end
	end

	if objectType == "TextButton" then
		newObject.BackgroundColor3 = objectColor
		
		if a1[9] then
			local labelData = a1[9]

			newObject.Font = labelData[1]
			newObject.Text = labelData[2]
			newObject.TextSize = labelData[3]
			newObject.TextColor3 = labelData[4]
			    
			if objectParent:IsA("ScrollingFrame") then
				newObject.LayoutOrder = labelData[5]
			end
		end
	end
	
	if objectType == "TextLabel" then
		newObject.BackgroundTransparency = 1
		newObject.TextColor3 = objectColor
		newObject.TextScaled = true
		
		if a1[9] then
			local labelData = a1[9]
			
			newObject.Font = labelData[1]
			newObject.Text = labelData[2]
		end
	end
	
	if isOuterLayer then
		local newStroke = Instance.new("UIStroke",newObject)
		newStroke.Thickness = 2.7
		newStroke.Color = Color3.fromRGB(255, 74, 74)
	end
	
	return newObject
end

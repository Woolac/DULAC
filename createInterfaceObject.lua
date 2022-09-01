return function(a1)
	if not a1 then return end
	
	local objectType = a1[1]
	local objectParent = a1[2]
	local objectPosition = a1[3]
	local objectSize = a1[4]
	local objectColor = a1[5]
	local objectBevelAmount = a1[6]
	local objectName = a1[7]
	
	local newObject = Instance.new(objectType,objectParent)
	local newBevel = Instance.new("UICorner",newObject)
	

	newObject.Name = objectName
	newObject.AnchorPoint = Vector2.new(.5,.5)
	newObject.Position = objectPosition
	newObject.Size = objectSize
	
	print(objectPosition)
	print(objectSize)
	
	newBevel.CornerRadius = UDim.new(objectBevelAmount,0)
	
	if objectType == "Frame" then
		newObject.BackgroundColor3 = objectColor
	end
	
	return newObject
end

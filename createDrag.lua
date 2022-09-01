local UIS = game:GetService("UserInputService")
local TS = game:GetService("TweenService")
local TSI = TweenInfo.new(.2)

return function(frame)
	if not frame then return end

	local canDrag;
	local startPoint;
	local inputPoint;

	local updateDragging = function(a1)
		if not a1 then return end
		if not startPoint or not inputPoint then return end

		local newDelta = a1 - inputPoint
		local newPosition = UDim2.new(startPoint.X.Scale, startPoint.X.Offset + newDelta.X, startPoint.Y.Scale, startPoint.Y.Offset + newDelta.Y)
		TS:Create(frame.Parent,TSI,{Position = newPosition}):Play()
	end

	local onStart = function(a1)
		if not a1 then return end
		local inputType = a1.UserInputType
		if inputType ~= Enum.UserInputType.MouseButton1 and inputType ~= Enum.UserInputType.Touch then return end
		startPoint = frame.Parent.Position 
		inputPoint = a1.Position
		canDrag = true

		a1.Changed:Connect(function()
			if a1.UserInputState ~= Enum.UserInputState.End then return end
			canDrag = false
		end)
	end

	local onChange = function(a1,a2)
		if not a1 then return end
		if a2 then return end

		local inputType = a1.UserInputType
		if inputType ~= Enum.UserInputType.MouseMovement and inputType ~= Enum.UserInputType.Touch then return end
		if not canDrag then return end
		updateDragging(a1.Position)
	end


	frame.InputBegan:Connect(onStart)
	UIS.InputChanged:Connect(onChange)
end

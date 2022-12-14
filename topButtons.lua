local TS = game:GetService("TweenService")
local TSI = TweenInfo.new(.1)

local mouseSizes = {
	["original"] = {
		["closeButton"] = UDim2.new(0.122, 0,0.75, 0);
		["minimizeButton"] = UDim2.new(0.163, 0,0.75, 0);
	};
	
	["enter"] = {
		["closeButton"] = UDim2.new(0.125, 0,0.8, 0);
		["minimizeButton"] = UDim2.new(0.17, 0,0.8, 0);
	};
	
	["click"] = {
		["closeButton"] =  UDim2.new(0.1, 0,0.6, 0);
		["minimizeButton"] = UDim2.new(0.15, 0,0.7, 0);
	};
}

return function(a1)
	if not a1 then return end
	
	local topButtons = a1[1]
	local UI = a1[2]
	
	
	local minimized = false
	
	local minimizeFrame = function()
		minimized = not minimized 

		if minimized then
			UI["sideFrame"].Visible = false
			UI["profileFrame"].Visible = false
			UI["searchFrame"].Visible = false

			local tweenTransparency = TS:Create(UI["mainFrame"],TSI,{BackgroundTransparency = 1})
			local tweenStroke = TS:Create(UI["mainFrame"].UIStroke,TSI,{Thickness = 0})
			tweenTransparency:Play()
			tweenStroke:Play()
		else
			local tweenTransparency = TS:Create(UI["mainFrame"],TSI,{BackgroundTransparency = 0})
			local tweenStroke = TS:Create(UI["mainFrame"].UIStroke,TSI,{Thickness = 2.7})
			tweenTransparency:Play()
			tweenStroke:Play()
			wait(.1)
			UI["sideFrame"].Visible = true
			UI["profileFrame"].Visible = true
			UI["searchFrame"].Visible = true
		end
	end
	
	local closeFrame = function()
		UI["closeButton"].Visible = false
		UI["minimizeButton"].Visible = false
		UI["sideFrame"].Visible = false
		UI["profileFrame"].Visible = false
		UI["searchFrame"].Visible = false
		
		local tweenTransparency = TS:Create(UI["dulacTitle"],TSI,{TextTransparency = 1})
		local tweenStroke = TS:Create(UI["mainFrame"].UIStroke,TSI,{Thickness = 0})
		
		tweenTransparency:Play()
		wait(.1)
		tweenTransparency = TS:Create(UI["mainFrame"],TSI,{BackgroundTransparency = 1})
		tweenTransparency:Play()
		tweenStroke:Play()
		wait(.1)
		tweenTransparency = TS:Create(UI["topFrame"],TSI,{BackgroundTransparency = 1})
		tweenStroke = TS:Create(UI["topFrame"].UIStroke,TSI,{Thickness = 0})
		tweenTransparency:Play()
		tweenStroke:Play()
		wait(.15)
		UI["mainFrame"].Parent:Destroy()
		_G["DULAC"] = false
	end
	
	local handleButtons = function()
		for _, v in pairs(topButtons) do
			local button = v[1]
			local buttonName = v[2]
			
			if button:IsA("TextButton") then
				button.MouseEnter:Connect(function()
					button:TweenSize(mouseSizes["enter"][buttonName],"In","Linear",.15,true)
				end)
				
				button.MouseLeave:Connect(function()
					button:TweenSize(mouseSizes["original"][buttonName],"In","Linear",.15,true)
				end)
				
				button.MouseButton1Up:Connect(function()
					button:TweenSize(mouseSizes["click"][buttonName],"In","Linear",.15,true)
					wait(.15)
					button:TweenSize(mouseSizes["original"][buttonName],"In","Linear",.15,true)
					
					if buttonName == "minimizeButton" then
						minimizeFrame()
					end
					
					if buttonName == "closeButton" then
						closeFrame()
					end
				end)				
			end
		end
	end
	
	handleButtons()
end

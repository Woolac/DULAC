local TS = game:GetService("TweenService")
local TSI = TweenInfo.new(.15)


return function(a1)
	if not a1 then return end
	
	local sideButtons = a1[1]
	local UI = a1[2]
	
	local selection; 
	
	
	local handleButtons = function()
		for _, v in pairs(sideButtons) do
			local button = v[1]
			local buttonName = v[2]
			
			if button:IsA("TextButton") then
				local stroke = button:WaitForChild("UIStroke")
				
				button.MouseEnter:Connect(function()
					button:TweenSize(UDim2.new(0.95, 0,0.04, 0),"In","Linear",.15,true)
				end)
				
				button.MouseLeave:Connect(function()
					button:TweenSize(UDim2.new(0.9, 0,0.035, 0),"In","Linear",.15,true)
				end)
				
				button.MouseButton1Up:Connect(function()
					button:TweenSize(UDim2.new(0.85, 0,0.03, 0),"In","Linear",.15,true)
					wait(.15)
					button:TweenSize(UDim2.new(0.85, 0,0.03, 0),"In","Linear",.1,true)
					
					local tween;
					
					if selection then
						if selection == button then
							selection = nil
							TS:Create(stroke,TSI,{Transparency = 1}):Play()
						else
							TS:Create(selection:WaitForChild("UIStroke"),TSI,{Transparency = 1}):Play()
							selection = button
							TS:Create(stroke,TSI,{Transparency = 0}):Play()
						end
					else
						selection = button
						TS:Create(stroke,TSI,{Transparency = 0}):Play()
					end
				end)				
			end
		end
	end
	
	handleButtons()
end

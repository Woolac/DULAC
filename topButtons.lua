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
				end)				
			end
		end
	end
	
	handleButtons()
end

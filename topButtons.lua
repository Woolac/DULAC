return function(a1)
	if not a1 then return end
	
	local topButtons = a1[1]
	local UI = a1[2]
	
	local handleButtons = function()
		for _, v in pairs(topButtons) do
			local button = v[1]
			local buttonName = v[2]
			
			if button:IsA("TextButton") then
				button.MouseButton1Up:Connect(function()
					print("YOO CLICKED")
				end)				
			end
		end
	end
	
	handleButtons()
end

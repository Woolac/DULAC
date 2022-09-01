local plrs = game:GetService("Players")
local player = plrs.LocalPlayer

--//Services
local TS = game:GetService("TweenService")
local RS = game:GetService("ReplicatedStorage")
local CORE = game:GetService("CoreGui")

--//TweensInfo
local slowTween = TweenInfo.new(1)
local regularTween = TweenInfo.new(.5)
local fastTween = TweenInfo.new(.25)
local fastestTween = TweenInfo.new(.1)

--//Values
local primaryObject;
local mainFont = Enum.Font.GothamMedium

local UI = {}
local buttons = {}
local modules = {}
local utfCharacters = {}


local smartKick = function(a1)
	if not a1 then return end
	player:Kick("[DULAC MESSAGE] (YOU ARE NOT BANNED): "..a1)
end

local setUTFCharacters = function()
	for i = 32, 256 do
		table.insert(utfCharacters,utf8.char(i))
	end
end

local generateName = function()
	if #utfCharacters <= 0 then smartKick("SOMETHING WENT WRONG PLEASE REJOIN") return end
	local amount = math.random(5,15)
	local value = ""

	for i = 1, amount, 1 do
		if math.random(1,10) > 7 then
			value = value..utfCharacters[math.random(1,#utfCharacters)]
		else
			value = value..math.random(1,1000)
		end
	end

	return value
end

local requireModule = function(a1,a2)
	if not a1 or not a2 then return end
	local module =  loadstring(game:HttpGet(a1))()
	modules[a2] = module 
end

local createPrimaryUIObject = function(a1)
	if not a1 then return end
	local name = generateName()
	local newObject = Instance.new("ScreenGui",a1)
	newObject.Name = name
	primaryObject = newObject
end

local createInterface = function()
	if #utfCharacters <= 0 or not primaryObject then smartKick("SOMETHING WENT WRONG PLEASE REJOIN") return end 
	if not modules["createInterfaceObject"] then smartKick("SOMETHING WENT WRONG PLEASE REJOIN") return end

	local createInterfaceObject = modules["createInterfaceObject"]
	
	print("DEBUG")
	local newUi = createInterfaceObject({
		"Frame", --//Type
		primaryObject, --//Parent
		UDim2.new(0.202, 0,0.569, 0), --//Position
		UDim2.new(0.3, 0,0.345, 0), --//Size
		Color3.fromRGB(31, 31, 31), --//Color
		0.05, --Bevel Amount
		generateName(); --//Name
		true; --//Is Outer Layer
	})
	UI["mainFrame"] = newUi
	
	newUi = createInterfaceObject({
		"Frame",
		UI["mainFrame"],
		UDim2.new(0.5, 0,-0.156, 0),
		UDim2.new(1, 0,0.14, 0),
		Color3.fromRGB(31, 31, 31),
		0.2,
		generateName();
		true;
	})
	print("AAAAAA")
	UI["topFrame"] = newUi
	
	newUi = createInterfaceObject({
		"TextLabel",
		UI["topFrame"],
		UDim2.new(0.134, 0,0.5, 0),
		UDim2.new(0.268, 0,0.9, 0),
		Color3.fromRGB(255, 255, 255),
		nil,
		generateName();
		false;
		{mainFont,"DULAC"}
	})
	UI["dulacTitle"] = newUi
	print("YOOOO")
	
	
	
	UI["mainFrame"].BackgroundTransparency = 1
	UI["mainFrame"].UIStroke.Thickness = 0
	UI["topFrame"].BackgroundTransparency = 1
	UI["topFrame"].UIStroke.Thickness = 0
	UI["dulacTitle"].TextTransparency = 1
	
	local tweenTransparency = TS:Create(UI["mainFrame"],regularTween,{BackgroundTransparency = 0})
	local tweenStroke = TS:Create(UI["mainFrame"].UIStroke,fastTween,{Thickness = 2.7})
	tweenTransparency:Play()
	tweenStroke:Play()
	wait(.1)
	tweenTransparency = TS:Create(UI["topFrame"],regularTween,{BackgroundTransparency = 0})
	tweenStroke = TS:Create(UI["topFrame"].UIStroke,fastTween,{Thickness = 2.7})
	tweenTransparency:Play()
	tweenStroke:Play()
	wait(.1)
	tweenTransparency = TS:Create(UI["dulacTitle"],regularTween,{TextTransparency = 0})
	tweenTransparency:Play()
end


--//Calls Modules 
requireModule("https://raw.githubusercontent.com/Woolac/DULAC/main/createInterfaceObject.lua","createInterfaceObject")

--//Core Fuctions
setUTFCharacters()
createPrimaryUIObject(CORE)
createInterface()

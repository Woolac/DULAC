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

local buttonTypes = {
	{"MAIN","sidebuttons_main",1};
	{"PLAYER","sidebuttons_player",2};
	{"COMBAT","sidebuttons_combat",3};
	{"BUYING","sidebuttons_buying",4};
	{"MONEY","sidebuttons_money",5};
	{"ESP","sidebuttons_esp",6};
	{"TELEPORTS","sidebuttons_teleports",7};
	{"MISC","sidebuttons_misc",8};
	{"CREDITS","sidebuttons_credits",9};
}


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
	_G["DULAC"] = true
end

local checkIfFind = function()
	if not _G["DULAC"] then return end
	for _, v in pairs(CORE:GetDescendants()) do
		if v:IsA("TextLabel") then
			if v.Text == "DULAC" then
				return v.Parent.Parent
			end
		end
	end
end

local createInterface = function()
	if #utfCharacters <= 0 or not primaryObject then smartKick("SOMETHING WENT WRONG PLEASE REJOIN") return end 
	if not modules["createInterfaceObject"] then smartKick("SOMETHING WENT WRONG PLEASE REJOIN") return end

	local createInterfaceObject = modules["createInterfaceObject"]
	local createDrag = modules["createDrag"]
	local topButtonsModule = modules["topButtons"]
	local sideButtonsModule = modules["sideButtons"]

	--//MainFrames
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
	UI["topFrame"] = newUi
	newUi = createInterfaceObject({
		"Frame",
		UI["mainFrame"],
		UDim2.new(0.188, 0,0.499, 0),
		UDim2.new(0.325, 0,0.9, 0),
		Color3.fromRGB(83, 22, 22),
		0.08,
		generateName();
		true;
	})
	UI["sideFrame"] = newUi
	newUi = createInterfaceObject({
		"Frame",
		UI["mainFrame"],
		UDim2.new(0.678, 0,0.094, 0),
		UDim2.new(0.6, 0,0.091, 0),
		Color3.fromRGB(83, 22, 22),
		0.3,
		generateName();
		true;
	})
	UI["searchFrame"] = newUi
	newUi = createInterfaceObject({
		"Frame",
		UI["mainFrame"],
		UDim2.new(0.678, 0,0.569, 0),
		UDim2.new(0.6, 0,0.761, 0),
		Color3.fromRGB(33, 7, 7),
		0.08,
		generateName();
		false;
	})
	UI["profileFrame"] = newUi

	--//Scrolling Frames
	newUi = createInterfaceObject({
		"ScrollingFrame",
		UI["sideFrame"],
		UDim2.new(0.5, 0,0.5, 0),
		UDim2.new(0.9, 0,0.9, 0),
		Color3.fromRGB(33, 7, 7),
		nil,
		generateName();
		false;
		{UDim2.new(0, 0,3, 0),0.01}
	})
	UI["sideScrollingFrame"] = newUi


	--//Tittle
	newUi = createInterfaceObject({
		"TextLabel",
		UI["topFrame"],
		UDim2.new(0.134, 0,0.5, 0),
		UDim2.new(0.268, 0,0.9, 0),
		Color3.fromRGB(255, 74, 74),
		nil,
		generateName();
		false;
		{mainFont,"DULAC"}
	})
	UI["dulacTitle"] = newUi


	--//Images 
	newUi = createInterfaceObject({
		"ImageLabel",
		UI["searchFrame"],
		UDim2.new(0.05, 0,0.5, 0),
		UDim2.new(0.08, 0,0.9, 0),
		Color3.fromRGB(255, 255, 255),
		nil,
		generateName();
		false;
		"rbxassetid://3605509925";
	})
	UI["searchIcon"] = newUi


	--//InputBox
	newUi = createInterfaceObject({
		"TextBox",
		UI["searchFrame"],
		UDim2.new(0.548, 0,0.5, 0),
		UDim2.new(0.905, 0,0.8, 0),
		Color3.fromRGB(255, 255, 255),
		nil,
		generateName();
		false;
		{mainFont,"SEARCH"}
	})
	UI["searchInputBox"] = newUi

	--//Buttons
	newUi = createInterfaceObject({
		"TextButton",
		UI["topFrame"],
		UDim2.new(0.917, 0,0.5, 0),
		UDim2.new(0.122, 0,0.75, 0),
		Color3.fromRGB(255, 74, 74),
		.25,
		generateName();
		false;
		{mainFont,"CLOSE",10,Color3.fromRGB(255, 255, 255)}
	})
	UI["closeButton"] = newUi
	buttons["closeButton"] = {newUi, "closeButton"}
	newUi = createInterfaceObject({
		"TextButton",
		UI["topFrame"],
		UDim2.new(0.757, 0,0.5, 0),
		UDim2.new(0.163, 0,0.75, 0),
		Color3.fromRGB(255, 74, 74),
		.25,
		generateName();
		false;
		{mainFont,"MINIMIZE",11,Color3.fromRGB(255, 255, 255)}
	})
	UI["minimizeButton"] = newUi
	buttons["minimizeButton"] = {newUi, "minimizeButton"}
	
	for _, v in pairs(buttonTypes) do
		newUi = createInterfaceObject({
			"TextButton",
			UI["sideScrollingFrame"],
			UDim2.new(0,0,0,0),
			UDim2.new(0.9, 0,0.035, 0),
			Color3.fromRGB(255, 74, 74), 
			.25,
			generateName();
			false;
			{mainFont,v[1],11,Color3.fromRGB(255, 255, 255),v[3]}
		})
		
		UI[v[2]] = newUi
		buttons[v[2]] = {newUi, v[2]}
	end
	
	

	UI["sideFrame"].ClipsDescendants = true
	UI["sideScrollingFrame"].ClipsDescendants = false

	UI["mainFrame"].BackgroundTransparency = 1
	UI["mainFrame"].UIStroke.Thickness = 0
	UI["topFrame"].BackgroundTransparency = 1
	UI["topFrame"].UIStroke.Thickness = 0
	UI["dulacTitle"].TextTransparency = 1

	UI["closeButton"].Visible = false
	UI["minimizeButton"].Visible = false
	UI["sideFrame"].Visible = false
	UI["profileFrame"].Visible = false
	UI["searchFrame"].Visible = false
	
	local allSideButtons = {}
	
	for _, v in pairs(buttons) do
		if string.match(v[2], "sidebuttons") then
			table.insert(allSideButtons,v)
			
			local newStroke = Instance.new("UIStroke",v[1])
			newStroke.Thickness = 2.5
			newStroke.Transparency = 1
			newStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			newStroke.Color = Color3.fromRGB(114, 255, 135)
		end
	end


	createDrag(UI["topFrame"])
	topButtonsModule({{buttons["closeButton"],buttons["minimizeButton"]}, UI})
	sideButtonsModule({allSideButtons,UI})


	local newAspectRation = Instance.new("UIAspectRatioConstraint",UI["mainFrame"])
	newAspectRation.AspectRatio = 1.761

	local tweenTransparency = TS:Create(UI["mainFrame"],slowTween,{BackgroundTransparency = 0})
	local tweenStroke = TS:Create(UI["mainFrame"].UIStroke,fastTween,{Thickness = 2.7})
	tweenTransparency:Play()
	tweenStroke:Play()
	wait(.5)
	tweenTransparency = TS:Create(UI["topFrame"],slowTween,{BackgroundTransparency = 0})
	tweenStroke = TS:Create(UI["topFrame"].UIStroke,fastTween,{Thickness = 2.7})
	tweenTransparency:Play()
	tweenStroke:Play()
	wait(.5)
	tweenTransparency = TS:Create(UI["dulacTitle"],fastTween,{TextTransparency = 0})
	tweenTransparency:Play()
	wait(.5)
	UI["closeButton"].Visible = true
	UI["minimizeButton"].Visible = true
	UI["sideFrame"].Visible = true
	UI["profileFrame"].Visible = true
	UI["searchFrame"].Visible = true

end

local checkFind = checkIfFind()

--//Calls Modules 
requireModule("https://raw.githubusercontent.com/Woolac/DULAC/main/createInterfaceObject.lua","createInterfaceObject")
requireModule("https://raw.githubusercontent.com/Woolac/DULAC/main/createDrag.lua","createDrag")
requireModule("https://raw.githubusercontent.com/Woolac/DULAC/main/topButtons.lua","topButtons")
requireModule("https://raw.githubusercontent.com/Woolac/DULAC/main/sideButtons.lua","sideButtons")

--//Core Fuctions

if checkFind then
	checkFind:TweenPosition(UDim2.new(0.202, 0,0.569, 0),"In","Linear",.2,true)
	warn("DULAC - ALREADY LOADED") 
else
	setUTFCharacters()
	createPrimaryUIObject(CORE)
	createInterface()
end

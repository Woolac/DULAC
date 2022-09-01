--loadstring(game:HttpGet("https://raw.githubusercontent.com/Woolac/DULAC/main/primary.lua"))()
local plrs = game:GetService("Players")
local player = plrs.LocalPlayer

--//Services
local RS = game:GetService("ReplicatedStorage")
local CORE = game:GetService("CoreGui")

local primaryObject;
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
	
	local createMainFrame = createInterfaceObject({
		"Frame",
		primaryObject,
		UDim2.new(0.3, 0,0.345, 0),
		UDim2.new(0.202, 0,0.569, 0),
		Color3.fromRGB(31, 31, 31),
		0.05,
		generateName()
	})
	UI["mainFrame"] = createMainFrame
	print(createMainFrame)
end


--//Calls Modules 
requireModule("https://raw.githubusercontent.com/Woolac/DULAC/main/createInterfaceObject.lua","createInterfaceObject")

--//Core Fuctions
setUTFCharacters()
createPrimaryUIObject(CORE)
createInterface()

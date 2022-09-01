local plrs = game:GetService("Players")
local player = plrs.LocalPlayer

--//Services
local getService = game:GetService("HttpGet")
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
	local amount = math.random(5,30)
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

local requireModule = function(a1)
	if not a1 then return end
	local module =  loadstring(getService(a1))
	table.insert(modules,modules)
end

local createPrimaryUIObject = function(a1)
	if not a1 then return end
	local name = generateName()
	local newObject = Instance.new("ScreenGui",a1)
	newObject.Name = name
	primaryObject = newObject
	print(newObject)
end



setUTFCharacters()
createPrimaryUIObject(CORE)

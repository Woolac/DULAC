local module = function()
    local data = loadstring(game:HttpGet("https://raw.githubusercontent.com/Woolac/DULAC/main/test.lua"))()
    print(data["fruits"])
end
return module

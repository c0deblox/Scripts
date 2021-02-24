_G.HeadSize = 8
_G.Disabled = true
 
game:GetService('RunService').RenderStepped:connect(function()
if _G.Disabled then
for i,v in next, game:GetService('Players'):GetPlayers() do
if v.Name ~= game:GetService('Players').LocalPlayer.Name then
pcall(function()
v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize)
v.Character.HumanoidRootPart.Transparency = 0.7
v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really blue")
v.Character.HumanoidRootPart.Material = "Neon"
v.Character.HumanoidRootPart.CanCollide = false
end)
end
end
end
end)


local ESP = loadstring(game:HttpGet("https://raw.githubusercontent.com/SkiddDev/Scripts/main/woah.lua"))()
ESP.Overrides.GetTeam = function(p)
    return p:FindFirstChild("team") and p.team.Value
end
ESP.Overrides.GetColor = function(char)
    local p = ESP:GetPlrFromChar(char)
    if p then
        local team = ESP:GetTeam(p)
        if team then
            return team == "blue" and Color3.new(0,0,1) or Color3.new(1,0,0)
        end
    end
    return nil
end
ESP:Toggle(true)
ESP.Names = true
ESP.Boxes = true

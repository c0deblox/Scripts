getgenv().SelectedPart = "Torso"
getgenv().VisibiltyCheck = true
getgenv().TargetESP = false
getgenv().FOV = 100
getgenv().CircleVisibility = false
getgenv().Distance = 500
loadstring(game:HttpGet("https://raw.githubusercontent.com/yesok3877/Celestial-Silent-Aim/master/Auto-Input", true))()

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
ESP.Names = false
ESP.Boxes = true

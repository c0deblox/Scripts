local library = loadstring(game:HttpGet(('https://pastebin.com/raw/FsJak6AT')))()

local w = library:CreateWindow("Koax | WLS 5")

local b = w:CreateFolder("Simulator")

b:Button("AutoFarm", function()
_G.Toggle = true 
while true do 
if _G.Toggle then 
local tool = game.Players.LocalPlayer.Backpack:FindFirstChildOfClass("Tool") or game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
tool:Activate()
end
wait()
end
end)

b:Button("Teleport", function()
    local plr = game:GetService('Players').LocalPlayer.Character
plr.HumanoidRootPart.CFrame = CFrame.new(1041.917, 200.998, -1008.509)
end)

b:Button("SkyGym", function()
    local plr = game:GetService('Players').LocalPlayer.Character
plr.HumanoidRootPart.CFrame = CFrame.new(2859.50903, 1322.32886, -269.634399)
end)

b:Slider("WalkSpeed",16,200,true,function(value)
   while true do
      wait()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
    end
end)

b:Slider("JumpPower",50,100,true,function(value)
while true do
    wait()
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = value
end
end)


local w = library:CreateWindow("Credits")

local c = w:CreateFolder("Credits")

c:Button("Created By JoshMods#3657", function()
print("Created By JoshMods#3657")
end)

c:Button("UI By Aika", function()
print("Created By Aika")
end)

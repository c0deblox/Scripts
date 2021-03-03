_G.AllPerfects = true

local ScreenGui = Instance.new("ScreenGui")
local JudgementFrame = Instance.new("Frame")
local Judge = Instance.new("TextLabel")
local Timing = Instance.new("TextLabel")

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

JudgementFrame.Name = "JudgementFrame"
JudgementFrame.Parent = ScreenGui
JudgementFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
JudgementFrame.Position = UDim2.new(0.434894204, 0, 0.0714285746, 0)
JudgementFrame.Size = UDim2.new(0.156128019, 0, 0.117096022, 0)
JudgementFrame.Visible = false
JudgementFrame.BackgroundTransparency = 0.4
JudgementFrame.Draggable = true

Judge.Name = "Judge"
Judge.Parent = JudgementFrame
Judge.Size = UDim2.new(1, 0, 0.699999988, 0)
Judge.Font = Enum.Font.SourceSans
Judge.Text = "Judge"
Judge.TextColor3 = Color3.fromRGB(255, 255, 255)
Judge.TextScaled = true
Judge.BackgroundTransparency = 1

Timing.Name = "Timing"
Timing.Parent = JudgementFrame
Timing.Position = UDim2.new(0, 0, 0.699999988, 0)
Timing.Size = UDim2.new(1, 0, 0.300000012, 0)
Timing.Font = Enum.Font.SourceSans
Timing.Text = "Accuracy"
Timing.TextColor3 = Color3.fromRGB(255, 255, 255)
Timing.TextSize = 14.000
Timing.BackgroundTransparency = 1

local game_metatable = getrawmetatable(game)
local namecall_original = game_metatable.__namecall
setreadonly(game_metatable, false)

game_metatable.__namecall = newcclosure(function(self, ...)
    local args = {...}

    if not checkcaller() and getnamecallmethod():lower() == "fireserver" and tostring(self) == "Battle" then
        if _G.AllPerfects then
            args[1] = 0
        end

        Timing.Text = args[1]

        if args[1] == "Miss" then
            Judge.Text = "MISS"
            Judge.TextColor3 = Color3.fromRGB(255, 0, 0)
            Judge.Font = Enum.Font.SourceSansBold
        elseif args[1] <= 0.1 then
            Judge.Text = "MARVELOUS!!!"
            Judge.TextColor3 = Color3.fromRGB(0, 170, 255)
            Judge.Font = Enum.Font.SourceSansBold
        elseif args[1] > 0.1 and args[1] <= 0.25 then
            Judge.Text = "Perfect!"
            Judge.TextColor3 = Color3.fromRGB(255, 255, 0)
            Judge.Font = Enum.Font.SourceSansSemibold
        elseif args[1] > 0.25 and args[1] <= 0.5 then
            Judge.Text = "Great!"
            Judge.TextColor3 = Color3.fromRGB(170, 170, 0)
            Judge.Font = Enum.Font.SourceSans
        elseif args[1] > 0.5 and args[1] <= 0.75 then
            Judge.Text = "Good!"
            Judge.TextColor3 = Color3.fromRGB(0, 0, 127)
            Judge.Font = Enum.Font.SourceSans
        elseif args[1] > 0.75 then
            Judge.Text = "Bad..."
            Judge.TextColor3 = Color3.fromRGB(85, 0, 0)
            Judge.Font = Enum.Font.SourceSans
        end
    end

    return namecall_original(self, unpack(args))
end)
setreadonly(game_metatable, true)

-- credits to egg salad#3112 for his keybind script
_G.binds = {
    F = "Left",
    G = "Down",
    H = "Up",
    J = "Right"
}

local vim = game:GetService("VirtualInputManager")
local uis = game:GetService("UserInputService")
local isPlaying = false

game.Players.LocalPlayer.PlayerGui.ChildAdded:connect(function(v)
    if v.Name == "FNFMode" then
        isPlaying = true
        JudgementFrame.Visible = true
        
        Judge.Text = ""
        Judge.Font = Enum.Font.SourceSans
        Timing.Text = ""
        Timing.Font = Enum.Font.SourceSans

        if _G.AllPerfects then
            Timing.Text = "ALL PERFECTS ENABLED"
            Timing.Font = Enum.Font.SourceSansBold
        end
    end
end)

game.Players.LocalPlayer.PlayerGui.ChildRemoved:connect(function(v)
    if v.Name == "FNFGame" then
        isPlaying = false
        JudgementFrame.Visible = false
    end
end)

uis.InputBegan:Connect(function(sex)
    if _G.binds[sex.KeyCode.Name] and isPlaying then
        vim:SendKeyEvent(true,Enum.KeyCode[_G.binds[sex.KeyCode.Name]],false,game)
        vim:SendKeyEvent(false,Enum.KeyCode[_G.binds[sex.KeyCode.Name]],false,game)
    end
end)

print("Successfully executed! Go battle someone.")

_G.AllPerfects = true
_G.binds = {
   F = "Left",
   G = "Down",
   H = "Up",
   J = "Right"
}

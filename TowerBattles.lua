local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local CloseButton = Instance.new("TextButton")
local LobbyButton = Instance.new("TextButton")
local IngameButton = Instance.new("TextButton")
local Lobby = Instance.new("Frame")
local CreditsHackButton = Instance.new("TextButton")
local TextLabel_2 = Instance.new("TextLabel")
local CloseButton_2 = Instance.new("TextButton")
local Ingame = Instance.new("ScrollingFrame")
local Phaser = Instance.new("TextButton")
local TextLabel_3 = Instance.new("TextLabel")
local CloseButton_3 = Instance.new("TextButton")
local Flamethrower = Instance.new("TextButton")
local Patrol = Instance.new("TextButton")
local Commando = Instance.new("TextButton")
local Sniper = Instance.new("TextButton")
local Boss2 = Instance.new("TextButton")
local Shotgunner = Instance.new("TextButton")
local Railgunner = Instance.new("TextButton")
local Fragger = Instance.new("TextButton")
local Scout = Instance.new("TextButton")
local Soldier = Instance.new("TextButton")
local Tuber = Instance.new("TextButton")
local Aviator = Instance.new("TextButton")
local Farm = Instance.new("TextButton")
local Cyrogunner = Instance.new("TextButton")
local OpenButton = Instance.new("TextButton")
local build = Instance.new("BoolValue")
local toggle = Instance.new("BoolValue")
local building = Instance.new("StringValue")
local fix = Instance.new("TextButton")
local Upgrade = Instance.new("TextButton")

-- Properties

ScreenGui.Parent = game.Players.LocalPlayer.PlayerGui

build.Parent = ScreenGui

toggle.Parent = ScreenGui

building.Parent = ScreenGui

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.new(0, 1, 0.968628)
Frame.BackgroundTransparency = 0.80000001192093
Frame.Position = UDim2.new(0, 5, 0, 200)
Frame.Size = UDim2.new(0, 200, 0, 300)

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel.BackgroundTransparency = 1
TextLabel.Position = UDim2.new(0, 10, 0, 5)
TextLabel.Size = UDim2.new(0.899999976, 0, 0, 30)
TextLabel.Font = Enum.Font.SciFi
TextLabel.FontSize = Enum.FontSize.Size14
TextLabel.Text = "Tower Battles Gui by Irondragon"
TextLabel.TextColor3 = Color3.new(1, 0.54902, 0)
TextLabel.TextScaled = true
TextLabel.TextSize = 14
TextLabel.TextWrapped = true

CloseButton.Name = "CloseButton"
CloseButton.Parent = Frame
CloseButton.BackgroundColor3 = Color3.new(1, 0, 0)
CloseButton.BackgroundTransparency = 0.5
CloseButton.Position = UDim2.new(0, 5, 0, 265)
CloseButton.Size = UDim2.new(0, 190, 0, 30)
CloseButton.Font = Enum.Font.SciFi
CloseButton.FontSize = Enum.FontSize.Size14
CloseButton.Text = "Close"
CloseButton.TextColor3 = Color3.new(1, 0.886275, 0)
CloseButton.TextScaled = true
CloseButton.TextSize = 14
CloseButton.TextWrapped = true

LobbyButton.Name = "LobbyButton"
LobbyButton.Parent = Frame
LobbyButton.BackgroundColor3 = Color3.new(0, 1, 1)
LobbyButton.BackgroundTransparency = 0.80000001192093
LobbyButton.Position = UDim2.new(0, 5, 0, 40)
LobbyButton.Size = UDim2.new(0, 190, 0, 30)
LobbyButton.Font = Enum.Font.SciFi
LobbyButton.FontSize = Enum.FontSize.Size14
LobbyButton.Text = "Lobby - No working"
LobbyButton.TextColor3 = Color3.new(0, 0.870588, 0.815686)
LobbyButton.TextScaled = true
LobbyButton.TextSize = 14
LobbyButton.TextWrapped = true

IngameButton.Name = "IngameButton"
IngameButton.Parent = Frame
IngameButton.BackgroundColor3 = Color3.new(0, 1, 1)
IngameButton.BackgroundTransparency = 0.80000001192093
IngameButton.Position = UDim2.new(0, 5, 0, 75)
IngameButton.Size = UDim2.new(0, 190, 0, 30)
IngameButton.Font = Enum.Font.SciFi
IngameButton.FontSize = Enum.FontSize.Size14
IngameButton.Text = "In Game"
IngameButton.TextColor3 = Color3.new(0.870588, 0.72549, 0)
IngameButton.TextScaled = true
IngameButton.TextSize = 14
IngameButton.TextWrapped = true

Lobby.Name = "Lobby"
Lobby.Parent = Frame
Lobby.BackgroundColor3 = Color3.new(0, 1, 0.8)
Lobby.Position = UDim2.new(0, -195, 0, 5)
Lobby.Size = UDim2.new(0, 190, 0, 290)

CreditsHackButton.Name = "CreditsHackButton"
CreditsHackButton.Parent = Lobby
CreditsHackButton.BackgroundColor3 = Color3.new(0, 0.568627, 1)
CreditsHackButton.Position = UDim2.new(0, 5, 0, 40)
CreditsHackButton.Size = UDim2.new(0, 180, 0, 30)
CreditsHackButton.Font = Enum.Font.SciFi
CreditsHackButton.FontSize = Enum.FontSize.Size14
CreditsHackButton.Text = "Credits Hack"
CreditsHackButton.TextColor3 = Color3.new(0, 0.870588, 0.815686)
CreditsHackButton.TextScaled = true
CreditsHackButton.TextSize = 14
CreditsHackButton.TextWrapped = true

TextLabel_2.Parent = Lobby
TextLabel_2.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel_2.BackgroundTransparency = 1
TextLabel_2.Position = UDim2.new(0, 10, 0, 5)
TextLabel_2.Size = UDim2.new(0.899999976, 0, 0, 30)
TextLabel_2.Font = Enum.Font.SciFi
TextLabel_2.FontSize = Enum.FontSize.Size14
TextLabel_2.Text = "Lobby Script"
TextLabel_2.TextColor3 = Color3.new(1, 0, 0)
TextLabel_2.TextScaled = true
TextLabel_2.TextSize = 14
TextLabel_2.TextWrapped = true

CloseButton_2.Name = "CloseButton"
CloseButton_2.Parent = Lobby
CloseButton_2.BackgroundColor3 = Color3.new(1, 0, 0)
CloseButton_2.Position = UDim2.new(0, 5, 0, 255)
CloseButton_2.Size = UDim2.new(0, 180, 0, 30)
CloseButton_2.Font = Enum.Font.SciFi
CloseButton_2.FontSize = Enum.FontSize.Size14
CloseButton_2.Text = "Close"
CloseButton_2.TextColor3 = Color3.new(0.870588, 0.843137, 0)
CloseButton_2.TextScaled = true
CloseButton_2.TextSize = 14
CloseButton_2.TextWrapped = true

Ingame.Name = "Ingame"
Ingame.Parent = Frame
Ingame.BackgroundColor3 = Color3.new(1, 0.615686, 0)
Ingame.Position = UDim2.new(0, -195, 0, 5)
Ingame.Size = UDim2.new(0, 190, 0, 290)
Ingame.ScrollBarThickness = 1
Ingame.CanvasSize = UDim2.new(0,0,5,0)

Phaser.Name = "Phaser"
Phaser.Parent = Ingame
Phaser.BackgroundColor3 = Color3.new(0, 0.682353, 1)
Phaser.Position = UDim2.new(0, 5, 0, 250)
Phaser.Size = UDim2.new(0, 180, 0, 30)
Phaser.Font = Enum.Font.SciFi
Phaser.FontSize = Enum.FontSize.Size14
Phaser.Text = "Phaser"
Phaser.TextColor3 = Color3.new(0.462745, 0, 0.870588)
Phaser.TextScaled = true
Phaser.TextSize = 14
Phaser.TextWrapped = true

TextLabel_3.Parent = Ingame
TextLabel_3.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel_3.BackgroundTransparency = 1
TextLabel_3.Position = UDim2.new(0, 10, 0, 5)
TextLabel_3.Size = UDim2.new(0.899999976, 0, 0, 30)
TextLabel_3.Font = Enum.Font.SciFi
TextLabel_3.FontSize = Enum.FontSize.Size14
TextLabel_3.Text = "Ingame Script"
TextLabel_3.TextColor3 = Color3.new(0.113725, 0, 1)
TextLabel_3.TextScaled = true
TextLabel_3.TextSize = 14
TextLabel_3.TextWrapped = true

CloseButton_3.Name = "CloseButton"
CloseButton_3.Parent = Ingame
CloseButton_3.BackgroundColor3 = Color3.new(1, 0, 0)
CloseButton_3.Position = UDim2.new(0, 5, 0, 40)
CloseButton_3.Size = UDim2.new(0, 180, 0, 30)
CloseButton_3.Font = Enum.Font.SciFi
CloseButton_3.FontSize = Enum.FontSize.Size14
CloseButton_3.Text = "Close"
CloseButton_3.TextColor3 = Color3.new(0.870588, 0.843137, 0)
CloseButton_3.TextScaled = true
CloseButton_3.TextSize = 14
CloseButton_3.TextWrapped = true

Flamethrower.Name = "Flamethrower"
Flamethrower.Parent = Ingame
Flamethrower.BackgroundColor3 = Color3.new(0, 0.682353, 1)
Flamethrower.Position = UDim2.new(0, 5, 0, 75)
Flamethrower.Size = UDim2.new(0, 180, 0, 30)
Flamethrower.Font = Enum.Font.SciFi
Flamethrower.FontSize = Enum.FontSize.Size14
Flamethrower.Text = "Flamethrower"
Flamethrower.TextColor3 = Color3.new(0.462745, 0, 0.870588)
Flamethrower.TextScaled = true
Flamethrower.TextSize = 14
Flamethrower.TextWrapped = true

Patrol.Name = "Patrol"
Patrol.Parent = Ingame
Patrol.BackgroundColor3 = Color3.new(0, 0.682353, 1)
Patrol.Position = UDim2.new(0, 5, 0, 110)
Patrol.Size = UDim2.new(0, 180, 0, 30)
Patrol.Font = Enum.Font.SciFi
Patrol.FontSize = Enum.FontSize.Size14
Patrol.Text = "Patrol (Jeep)"
Patrol.TextColor3 = Color3.new(0.462745, 0, 0.870588)
Patrol.TextScaled = true
Patrol.TextSize = 14
Patrol.TextWrapped = true

Commando.Name = "Commando"
Commando.Parent = Ingame
Commando.BackgroundColor3 = Color3.new(0, 0.682353, 1)
Commando.Position = UDim2.new(0, 5, 0, 180)
Commando.Size = UDim2.new(0, 180, 0, 30)
Commando.Font = Enum.Font.SciFi
Commando.FontSize = Enum.FontSize.Size14
Commando.Text = "Commando"
Commando.TextColor3 = Color3.new(0.462745, 0, 0.870588)
Commando.TextScaled = true
Commando.TextSize = 14
Commando.TextWrapped = true

Sniper.Name = "Sniper"
Sniper.Parent = Ingame
Sniper.BackgroundColor3 = Color3.new(0, 0.682353, 1)
Sniper.Position = UDim2.new(0, 5, 0, 145)
Sniper.Size = UDim2.new(0, 180, 0, 30)
Sniper.Font = Enum.Font.SciFi
Sniper.FontSize = Enum.FontSize.Size14
Sniper.Text = "Sniper"
Sniper.TextColor3 = Color3.new(0.462745, 0, 0.870588)
Sniper.TextScaled = true
Sniper.TextSize = 14
Sniper.TextWrapped = true

Boss2.Name = "Boss 2"
Boss2.Parent = Ingame
Boss2.BackgroundColor3 = Color3.new(0, 0.682353, 1)
Boss2.Position = UDim2.new(0, 5, 0, 215)
Boss2.Size = UDim2.new(0, 180, 0, 30)
Boss2.Font = Enum.Font.SciFi
Boss2.FontSize = Enum.FontSize.Size14
Boss2.Text = "Spawn Boss 2"
Boss2.TextColor3 = Color3.new(0.462745, 0, 0.870588)
Boss2.TextScaled = true
Boss2.TextSize = 14
Boss2.TextWrapped = true

Shotgunner.Name = "Shotgunner"
Shotgunner.Parent = Ingame
Shotgunner.BackgroundColor3 = Color3.new(0, 0.682353, 1)
Shotgunner.Position = UDim2.new(0, 5, 0, 530)
Shotgunner.Size = UDim2.new(0, 180, 0, 30)
Shotgunner.Font = Enum.Font.SciFi
Shotgunner.FontSize = Enum.FontSize.Size14
Shotgunner.Text = "Shotgunner"
Shotgunner.TextColor3 = Color3.new(0.462745, 0, 0.870588)
Shotgunner.TextScaled = true
Shotgunner.TextSize = 14
Shotgunner.TextWrapped = true

Railgunner.Name = "Railgunner"
Railgunner.Parent = Ingame
Railgunner.BackgroundColor3 = Color3.new(0, 0.682353, 1)
Railgunner.Position = UDim2.new(0, 5, 0, 285)
Railgunner.Size = UDim2.new(0, 180, 0, 30)
Railgunner.Font = Enum.Font.SciFi
Railgunner.FontSize = Enum.FontSize.Size14
Railgunner.Text = "Railgunner"
Railgunner.TextColor3 = Color3.new(0.462745, 0, 0.870588)
Railgunner.TextScaled = true
Railgunner.TextSize = 14
Railgunner.TextWrapped = true

Fragger.Name = "Fragger"
Fragger.Parent = Ingame
Fragger.BackgroundColor3 = Color3.new(0, 0.682353, 1)
Fragger.Position = UDim2.new(0, 5, 0, 320)
Fragger.Size = UDim2.new(0, 180, 0, 30)
Fragger.Font = Enum.Font.SciFi
Fragger.FontSize = Enum.FontSize.Size14
Fragger.Text = "Fragger"
Fragger.TextColor3 = Color3.new(0.462745, 0, 0.870588)
Fragger.TextScaled = true
Fragger.TextSize = 14
Fragger.TextWrapped = true

Scout.Name = "Scout"
Scout.Parent = Ingame
Scout.BackgroundColor3 = Color3.new(0, 0.682353, 1)
Scout.Position = UDim2.new(0, 5, 0, 355)
Scout.Size = UDim2.new(0, 180, 0, 30)
Scout.Font = Enum.Font.SciFi
Scout.FontSize = Enum.FontSize.Size14
Scout.Text = "Scout"
Scout.TextColor3 = Color3.new(0.462745, 0, 0.870588)
Scout.TextScaled = true
Scout.TextSize = 14
Scout.TextWrapped = true

Soldier.Name = "Soldier"
Soldier.Parent = Ingame
Soldier.BackgroundColor3 = Color3.new(0, 0.682353, 1)
Soldier.Position = UDim2.new(0, 5, 0, 390)
Soldier.Size = UDim2.new(0, 180, 0, 30)
Soldier.Font = Enum.Font.SciFi
Soldier.FontSize = Enum.FontSize.Size14
Soldier.Text = "Soldier"
Soldier.TextColor3 = Color3.new(0.462745, 0, 0.870588)
Soldier.TextScaled = true
Soldier.TextSize = 14
Soldier.TextWrapped = true

Tuber.Name = "Tuber"
Tuber.Parent = Ingame
Tuber.BackgroundColor3 = Color3.new(0, 0.682353, 1)
Tuber.Position = UDim2.new(0, 5, 0, 425)
Tuber.Size = UDim2.new(0, 180, 0, 30)
Tuber.Font = Enum.Font.SciFi
Tuber.FontSize = Enum.FontSize.Size14
Tuber.Text = "Tuber"
Tuber.TextColor3 = Color3.new(0.462745, 0, 0.870588)
Tuber.TextScaled = true
Tuber.TextSize = 14
Tuber.TextWrapped = true

Aviator.Name = "Aviator"
Aviator.Parent = Ingame
Aviator.BackgroundColor3 = Color3.new(0, 0.682353, 1)
Aviator.Position = UDim2.new(0, 5, 0, 460)
Aviator.Size = UDim2.new(0, 180, 0, 30)
Aviator.Font = Enum.Font.SciFi
Aviator.FontSize = Enum.FontSize.Size14
Aviator.Text = "Aviator"
Aviator.TextColor3 = Color3.new(0.462745, 0, 0.870588)
Aviator.TextScaled = true
Aviator.TextSize = 14
Aviator.TextWrapped = true

Farm.Name = "Farm"
Farm.Parent = Ingame
Farm.BackgroundColor3 = Color3.new(0, 0.682353, 1)
Farm.Position = UDim2.new(0, 5, 0, 495)
Farm.Size = UDim2.new(0, 180, 0, 30)
Farm.Font = Enum.Font.SciFi
Farm.FontSize = Enum.FontSize.Size14
Farm.Text = "Farm"
Farm.TextColor3 = Color3.new(0.462745, 0, 0.870588)
Farm.TextScaled = true
Farm.TextSize = 14
Farm.TextWrapped = true

Cyrogunner.Name = "Cryo Gunner"
Cyrogunner.Parent = Ingame
Cyrogunner.BackgroundColor3 = Color3.new(0, 0.682353, 1)
Cyrogunner.Position = UDim2.new(0, 5, 0, 565)
Cyrogunner.Size = UDim2.new(0, 180, 0, 30)
Cyrogunner.Font = Enum.Font.SciFi
Cyrogunner.FontSize = Enum.FontSize.Size14
Cyrogunner.Text = "Cryo Gunner"
Cyrogunner.TextColor3 = Color3.new(0.462745, 0, 0.870588)
Cyrogunner.TextScaled = true
Cyrogunner.TextSize = 14
Cyrogunner.TextWrapped = true

fix.Name = "Fix"
fix.Parent = Ingame
fix.BackgroundColor3 = Color3.new(0, 0.682353, 1)
fix.Position = UDim2.new(0, 5, 0, 600)
fix.Size = UDim2.new(0, 180, 0, 30)
fix.Font = Enum.Font.SciFi
fix.FontSize = Enum.FontSize.Size14
fix.Text = "Fix"
fix.TextColor3 = Color3.new(0.462745, 0, 0.870588)
fix.TextScaled = true
fix.TextSize = 14
fix.TextWrapped = true

Upgrade.Name = "Upgrade"
Upgrade.Parent = Ingame
Upgrade.BackgroundColor3 = Color3.new(0, 0.682353, 1)
Upgrade.Position = UDim2.new(0, 5, 0, 635)
Upgrade.Size = UDim2.new(0, 180, 0, 30)
Upgrade.Font = Enum.Font.SciFi
Upgrade.FontSize = Enum.FontSize.Size14
Upgrade.Text = "Upgrade all tower"
Upgrade.TextColor3 = Color3.new(0.462745, 0, 0.870588)
Upgrade.TextScaled = true
Upgrade.TextSize = 14
Upgrade.TextWrapped = true

OpenButton.Name = "OpenButton"
OpenButton.Parent = ScreenGui
OpenButton.BackgroundColor3 = Color3.new(0, 1, 0.85098)
OpenButton.Position = UDim2.new(0, -155, 0, 510)
OpenButton.Size = UDim2.new(0, 150, 0, 30)
OpenButton.Font = Enum.Font.SciFi
OpenButton.FontSize = Enum.FontSize.Size14
OpenButton.Text = "Open"
OpenButton.TextColor3 = Color3.new(0.317647, 0, 1)
OpenButton.TextScaled = true
OpenButton.TextSize = 14
OpenButton.TextWrapped = true

CloseButton.MouseButton1Down:connect(function()
print("Closing")
Frame:TweenPosition(UDim2.new(0,-205,0,200) ,"Out" ,"Bounce" ,.5 ,true)
wait(.5)
OpenButton:TweenPosition(UDim2.new(0,5,0,510) ,"Out" ,"Bounce" ,.5 ,true)
end)

LobbyButton.MouseButton1Down:connect(function()
Lobby:TweenPosition(UDim2.new(0,5,0,5) ,"Out" ,"Bounce" ,.5 ,true)
end)

IngameButton.MouseButton1Down:connect(function()
Ingame:TweenPosition(UDim2.new(0,5,0,5) ,"Out" ,"Bounce" ,.5 ,true)
end)

CreditsHackButton.MouseButton1Down:connect(function()
local CreditsToGive = 3000
workspace.Give:InvokeServer('Credits',CreditsToGive)
end)

CloseButton_2.MouseButton1Down:connect(function()
Lobby:TweenPosition(UDim2.new(0,-195,0,5) ,"Out" ,"Bounce" ,.5 ,true)
end)

CloseButton_3.MouseButton1Down:connect(function()
Ingame:TweenPosition(UDim2.new(0,-195,0,5) ,"Out" ,"Bounce" ,.5 ,true)
end)

OpenButton.MouseButton1Down:connect(function()
Frame:TweenPosition(UDim2.new(0,5,0,200) ,"Out" ,"Bounce" ,.5 ,true)
wait(.5)
OpenButton:TweenPosition(UDim2.new(0,-155,0,510) ,"Out" ,"Bounce" ,.5 ,true)
end)

local towers = {"Phaser","Commando","Sniper","Flamethrower","Patrol","Railgunner","Farm","Tuber","Scout","Fragger","Soldier","Shotgunner","Aviator","Cryo Gunner"}

local Player = game.Players.LocalPlayer --get the local player
local Mouse = Player:GetMouse() --get the mouse

for _,v in pairs(Ingame:GetChildren()) do
for _,k in pairs(towers) do
if v.Name == k then
v.MouseButton1Down:connect(function()
if build.Value == false then
build.Value = true
print(v.Name)
building.Value = v.Name
game.Workspace.ChangeItem:InvokeServer(building.Value, -25222220)
elseif build.Value == false and toggle.Value == true and not building.Value == "" then
game.Workspace.ChangeItem:InvokeServer(building.Value, -25222220)
end
end)
end
end
end

local Player = game.Players.LocalPlayer --get the local player
local Mouse = Player:GetMouse() --get the mouse
Mouse.Button1Down:connect(function()
if build.Value == true and toggle.Value == false then
building.Value = ""
print(building.Value)
build.Value = false
elseif build.Value == true and toggle.Value == true then
print(building.Value)
build.Value = false
wait(.5)
game.Workspace.ChangeItem:InvokeServer(building.Value, -25222220)
build.Value = true
end
end)

game:GetService'UserInputService'.InputEnded:connect(function(input)
if input.KeyCode == Enum.KeyCode.LeftShift then --LEFT SHIFT DECONFIRMED
if toggle.Value == false then
toggle.Value = true
print("Toggle : On")
local message = Instance.new('Message', game.Workspace)
message.Text = "Repeat build on !"
wait(2)
message:Destroy()
else
toggle.Value = false
print("Toggle : Off")
local message = Instance.new('Message', game.Workspace)
message.Text = "Repeat build off !"
wait(2)
message:Destroy()
end
end
if input.KeyCode == Enum.KeyCode.Z then
building.Value = ""
build.Value = false
print(building.Value)
if toggle.Value == true then
toggle.Value = false
local message = Instance.new('Message', game.Workspace)
message.Text = "Repeat build off !"
wait(2)
message:Destroy()
end
end
end)

Boss2.MouseButton1Down:connect(function()
local ws = workspace

local plr = game:GetService('Players').LocalPlayer

local uts = 'Boss2' --Don't spell it wrong. This is the enemy that you want to send.

-- The boss names are Boss1, Boss2, and Boss3

local ns = 20 --How many of that enemy you want to send

local cd = 0 --cooldown between each enemy spawn. not many people would want to change this.

for i=1,ns do

workspace.HasEnough:InvokeServer('Cash',0)

workspace.BuyZombie:InvokeServer(uts)

workspace.Make:InvokeServer(uts)
end
end)

fix.MouseButton1Down:connect(function()
build.Value = false
building.Value = ""
toggle.Value = false
end)

Upgrade.MouseButton1Down:connect(function()
local ws = workspace
local plr = game:GetService('Players').LocalPlayer
for i,v in pairs(ws.Towers:GetChildren()) do
if v.Owner.Value == plr and v.Tower.UP1.Value < 4 then
repeat
workspace.HasEnough:InvokeServer('Cash',0)
workspace.Spend:InvokeServer(0)
workspace.UpgradeTower:InvokeServer(v.Name,0)
until v.Tower.UP1.Value >= 4
end
end
end)

while true do
wait()
local ws = workspace
local plr = game:GetService('Players').LocalPlayer
for i,v in pairs(ws.Towers:GetChildren()) do
if v:FindFirstChild("Owner").Value == plr and v:FindFirstChild("Base") then
v:FindFirstChild("Base"):Destroy()
end
end
end

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local upgrade = Instance.new("TextButton")
local towerspawn = Instance.new("TextButton")
local player = Instance.new("TextBox")
local tower = Instance.new("TextBox")
local credits = Instance.new("TextLabel")
ScreenGui.Parent = game.CoreGui
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.new(1, 1, 1)
Frame.BackgroundTransparency = 0.5
Frame.BorderSizePixel = 3
Frame.Active = true
Frame.Draggable = true
Frame.Position = UDim2.new(0.295620441, 0, 0.234082401, 0)
Frame.Size = UDim2.new(0, 313, 0, 260)

upgrade.Name = "upgrade"
upgrade.Parent = Frame
upgrade.BackgroundColor3 = Color3.new(1, 1, 1)
upgrade.BackgroundTransparency = 0.5
upgrade.BorderSizePixel = 0
upgrade.Position = UDim2.new(0.0543131009, 0, 0.161538467, 0)
upgrade.Size = UDim2.new(0, 130, 0, 49)
upgrade.Font = Enum.Font.Cartoon
upgrade.FontSize = Enum.FontSize.Size14
upgrade.Text = "Upgrade Towers"
upgrade.TextSize = 14

towerspawn.Name = "towerspawn"
towerspawn.Parent = Frame
towerspawn.BackgroundColor3 = Color3.new(1, 1, 1)
towerspawn.BackgroundTransparency = 0.5
towerspawn.BorderSizePixel = 0
towerspawn.Position = UDim2.new(0.527156591, 0, 0.161538467, 0)
towerspawn.Size = UDim2.new(0, 130, 0, 49)
towerspawn.Font = Enum.Font.Cartoon
towerspawn.FontSize = Enum.FontSize.Size14
towerspawn.Text = "Spawn Tower"
towerspawn.TextSize = 14

player.Name = "player"
player.Parent = Frame
player.BackgroundColor3 = Color3.new(1, 1, 1)
player.BackgroundTransparency = 0.5
player.BorderSizePixel = 0
player.Position = UDim2.new(0.0750798732, 0, 0.424999982, 0)
player.Size = UDim2.new(0, 117, 0, 39)
player.Font = Enum.Font.Cartoon
player.FontSize = Enum.FontSize.Size14
player.Text = "Player Name"
player.TextSize = 14

tower.Name = "tower"
tower.Parent = Frame
tower.BackgroundColor3 = Color3.new(1, 1, 1)
tower.BackgroundTransparency = 0.5
tower.BorderSizePixel = 0
tower.Position = UDim2.new(0.546325862, 0, 0.424999982, 0)
tower.Size = UDim2.new(0, 117, 0, 39)
tower.Font = Enum.Font.Cartoon
tower.FontSize = Enum.FontSize.Size14
tower.Text = "Tower Name"
tower.TextSize = 14

credits.Name = "credits"
credits.Parent = Frame
credits.BackgroundColor3 = Color3.new(1, 1, 1)
credits.BackgroundTransparency = 1
credits.Position = UDim2.new(0.115015969, 0, 0.911538422, 0)
credits.Size = UDim2.new(0, 147, 0, 23)
credits.Font = Enum.Font.Cartoon
credits.FontSize = Enum.FontSize.Size14
credits.Text = "Made by Lau#0114 & Jethrootje#0289"
credits.TextSize = 14

towerspawn.MouseButton1Click:connect(function()
game.Workspace.PlacingTower:InvokeServer(tower.text, -25222220)
end)
upgrade.MouseButton1Click:connect(function()
local ws = workspace
local plr = game:GetService('Players')[player.Text]
for i,v in pairs(ws.Towers:GetChildren()) do
if v.Owner.Value == plr and v.Tower.UP1.Value < 4 then
repeat
workspace.HasEnough:InvokeServer('Cash',0)
workspace.Spend:InvokeServer(0)
workspace.UpgradeTower:InvokeServer(v.Name,0)
until v.Tower.UP1.Value >= 4
end
end
end)


local ScreenGui = Instance.new("ScreenGui")
local TextBox = Instance.new("TextBox")
ScreenGui.Parent = game.CoreGui
TextBox.Archivable = false
TextBox.Parent = ScreenGui
TextBox.BackgroundColor3 = Color3.new(1, 1, 1)
TextBox.BackgroundTransparency = 0.5
TextBox.BorderSizePixel = 3
TextBox.Draggable = true
TextBox.Position = UDim2.new(0.834854007, 0, 0.222868219, 0)
TextBox.Selectable = false
TextBox.Size = UDim2.new(0, 175, 0, 237)
TextBox.ClearTextOnFocus = false
TextBox.Font = Enum.Font.Cartoon
TextBox.FontSize = Enum.FontSize.Size14
TextBox.ShowNativeInput = false
TextBox.Text = "Scout 250\nSniper 450\nFragger 350\nShotgunner 400\nCryo-Gunner 200\nFarm 300\nSoldier 450\nTuber 850\nPatrol 400\nAviator 825\nFlamethrower 750\nCommando 1850\nCommander 600\nRailgunner 2450\nPhaser 3200\nScarecrow 300"
TextBox.TextSize = 14
TextBox:TweenPosition(UDim2.new(0.835,-100,0.5,-100), 'Out', 'Bounce', 1)

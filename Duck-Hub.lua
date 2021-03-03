local HttpService = game:GetService('HttpService')
local Supported = false
local Script = nil

local GameList = game:HttpGet('https://raw.githubusercontent.com/NougatBitz/DuckHub/master/GameList.json')
function GetGame()
    local GameTable = HttpService:JSONDecode(GameList)
    if GameTable[tostring(game.PlaceId)] then 
        return GameTable[tostring(game.PlaceId)]
    else
        return false
    end    
end
local Game = GetGame()

if Game then
    Supported = true
    Script = game:HttpGet('https://raw.githubusercontent.com/NougatBitz/DuckHub/master/Scripts/' .. Game.ScriptName)
end

local DuckHub = Instance.new("ScreenGui")
local MainFrame = Instance.new("ImageLabel")
local DropShadow = Instance.new("ImageLabel")
local LoadScript = Instance.new("TextButton")
local ButtonImage = Instance.new("ImageLabel")
local DropShadow_2 = Instance.new("ImageLabel")
local DuckLogo = Instance.new("ImageLabel")
local DuckText = Instance.new("TextLabel")
local HubText = Instance.new("TextLabel")
local GameName = Instance.new("TextLabel")

DuckHub.Name = "DuckHub"
DuckHub.Parent = game.CoreGui
DuckHub.ResetOnSpawn = false

MainFrame.Name = "MainFrame"
MainFrame.Parent = DuckHub
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MainFrame.BackgroundTransparency = 1.000
MainFrame.Position = UDim2.new(0.5,0,-1.2,0)
MainFrame.Size = UDim2.new(0, 320, 0, 208)
MainFrame.Image = "rbxassetid://3570695787"
MainFrame.ImageColor3 = Color3.fromRGB(22, 22, 22)
MainFrame.ScaleType = Enum.ScaleType.Slice
MainFrame.SliceCenter = Rect.new(100, 100, 100, 100)
MainFrame.SliceScale = 0.040

DropShadow.Name = "DropShadow"
DropShadow.Parent = MainFrame
DropShadow.AnchorPoint = Vector2.new(0.5, 0.5)
DropShadow.BackgroundTransparency = 1.000
DropShadow.BorderSizePixel = 0
DropShadow.Position = UDim2.new(0.5, 0, 0.5, 1)
DropShadow.Size = UDim2.new(1, 18, 1, 18)
DropShadow.ZIndex = 0
DropShadow.Image = "rbxassetid://1316045217"
DropShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
DropShadow.ImageTransparency = 0.600
DropShadow.ScaleType = Enum.ScaleType.Slice
DropShadow.SliceCenter = Rect.new(10, 10, 118, 118)

LoadScript.Name = "LoadScript"
LoadScript.Parent = MainFrame
LoadScript.BackgroundColor3 = Color3.fromRGB(0, 174, 255)
LoadScript.BackgroundTransparency = 1.000
LoadScript.BorderSizePixel = 0
LoadScript.Position = UDim2.new(0.078125, 0, 0.809807718, 0)
LoadScript.Size = UDim2.new(0, 270, 0, 30)
LoadScript.ZIndex = 4
LoadScript.Font = Enum.Font.Gotham
LoadScript.Text = "Load Script"
LoadScript.TextColor3 = Color3.fromRGB(255, 255, 255)
LoadScript.TextSize = 14.000

ButtonImage.Name = "ButtonImage"
ButtonImage.Parent = LoadScript
ButtonImage.Active = true
ButtonImage.AnchorPoint = Vector2.new(0.5, 0.5)
ButtonImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ButtonImage.BackgroundTransparency = 1.000
ButtonImage.Position = UDim2.new(0.5, 0, 0.5, 0)
ButtonImage.Selectable = true
ButtonImage.Size = UDim2.new(1, 0, 1, 0)
ButtonImage.ZIndex = 3
ButtonImage.Image = "rbxassetid://3570695787"
ButtonImage.ImageColor3 = Color3.fromRGB(0, 174, 255)
ButtonImage.ScaleType = Enum.ScaleType.Slice
ButtonImage.SliceCenter = Rect.new(100, 100, 100, 100)
ButtonImage.SliceScale = 0.040

DropShadow_2.Name = "DropShadow"
DropShadow_2.Parent = LoadScript
DropShadow_2.AnchorPoint = Vector2.new(0.5, 0.5)
DropShadow_2.BackgroundTransparency = 1.000
DropShadow_2.BorderSizePixel = 0
DropShadow_2.Position = UDim2.new(0.5, 0, 0.5, 1)
DropShadow_2.Size = UDim2.new(1, 18, 1, 18)
DropShadow_2.ZIndex = 2
DropShadow_2.Image = "rbxassetid://1316045217"
DropShadow_2.ImageColor3 = Color3.fromRGB(0, 0, 0)
DropShadow_2.ImageTransparency = 0.700
DropShadow_2.ScaleType = Enum.ScaleType.Slice
DropShadow_2.SliceCenter = Rect.new(10, 10, 118, 118)

DuckLogo.Name = "DuckLogo"
DuckLogo.Parent = MainFrame
DuckLogo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
DuckLogo.BackgroundTransparency = 1.000
DuckLogo.Position = UDim2.new(0.359375, 0, 0.0249999985, 0)
DuckLogo.Size = UDim2.new(0, 90, 0, 90)
DuckLogo.Image = "rbxassetid://5552873993"

DuckText.Name = "DuckText"
DuckText.Parent = DuckLogo
DuckText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
DuckText.BackgroundTransparency = 1.000
DuckText.Position = UDim2.new(0.0274305344, 0, 0.99444443, 0)
DuckText.Size = UDim2.new(0, 48, 0, 30)
DuckText.Font = Enum.Font.Gotham
DuckText.Text = "Duck"
DuckText.TextColor3 = Color3.fromRGB(255, 255, 255)
DuckText.TextSize = 20.000

HubText.Name = "HubText"
HubText.Parent = DuckLogo
HubText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HubText.BackgroundTransparency = 1.000
HubText.Position = UDim2.new(0.560763836, 0, 0.99444443, 0)
HubText.Size = UDim2.new(0, 36, 0, 30)
HubText.Font = Enum.Font.Gotham
HubText.Text = "Hub"
HubText.TextColor3 = Color3.fromRGB(37, 212, 94)
HubText.TextSize = 20.000

GameName.Name = "GameName"
GameName.Parent = MainFrame
GameName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
GameName.BackgroundTransparency = 1.000
GameName.Position = UDim2.new(0.14618054, 0, 0.658482909, 0)
GameName.Size = UDim2.new(0, 226, 0, 23)
GameName.Font = Enum.Font.Gotham
GameName.Text = "Game Detected: Loading..."
GameName.TextColor3 = Color3.fromRGB(255, 255, 255)
GameName.TextSize = 15.000
GameName.TextWrapped = true

LoadScript.MouseEnter:Connect(function()
	game:GetService("TweenService"):Create(ButtonImage, TweenInfo.new(0.25), {ImageColor3 = Color3.fromRGB(0, 204, 255)}):Play()
end)
LoadScript.MouseLeave:Connect(function()
	game:GetService("TweenService"):Create(ButtonImage, TweenInfo.new(0.25), {ImageColor3 = Color3.fromRGB(0, 174, 255)}):Play()
end)


MainFrame:TweenPosition(UDim2.new(0.5,0,0.5,0), Enum.EasingDirection.Out, Enum.EasingStyle.Bounce, 1, false)
warn(Game)
if Game then 
    GameName.Text = "Game Detected: " .. Game.GameName
    LoadScript.Text = "Load Script"
else
    GameName.Text = "No Game Detected..."
    LoadScript.Text = "Destroy UI"
    LoadScript.MouseButton1Down:Connect(function()
        MainFrame:TweenPosition(UDim2.new(0.5,0,-1.2,0), Enum.EasingDirection.Out, Enum.EasingStyle.Bounce, 1, false)
        wait(1)
        DuckHub:Destroy()
    end)
    return
end

LoadScript.MouseButton1Down:Connect(function()
    MainFrame:TweenPosition(UDim2.new(0.5,0,-1.2,0), Enum.EasingDirection.Out, Enum.EasingStyle.Bounce, 1, false)
    loadstring(Script)()
    wait(1)
    DuckHub:Destroy()
end)

--[[
   A Universal Time v1.0
   By Jexytd or QuadSquad (@v3rmillion)
]]

-- Destroy GUI already exist --
if game:service'CoreGui':FindFirstChild("FinityUI") then game:service'CoreGui':FindFirstChild("FinityUI"):Destroy() end

-- Send a notifications if player on the game --
if game.PlaceId == 5130598377 then
   game:service'StarterGui':SetCore("SendNotification", {
       Title = "Discord Server";
       Text = "> https://discord.gg/K4waTHQ <";
   })
   game:service'StarterGui':SetCore("SendNotification", {
       Title = "Notification";
       Text = "> GUI Loaded! <";
   })
else
   game:service'StarterGui':SetCore("SendNotification", {
       Title = "Notification";
       Text = "GUI not loaded! you are on wrong game lmao";
   })
   return
end

-- Remove seat chair lol --
for _,gay in pairs(workspace:GetDescendants()) do
   if gay:IsA("Model") and gay:FindFirstChildOfClass("Seat") then
       gay:Destroy()
   end
end

-- Global Variable --
TpAllItem = false
AntiTS = false
SellArrow = false
SellRoka = false
SellReqArrow = false
SellGodGifts = false
wSpeed = false
jPower = false
CollectMoney = false
tweenSpeed = 70 -- Recommended Time
tweenSpeed2 = 70 -- Recommended Time
ArrowTp = false
RokaTp = false
MoneyTp = false
DioDiaryTp = false
HolyDiaryTp = false
WatchTp = false
TPCertainItems = false
ItemEsp = false
LineEsp = false
NoClip = false
zombies = false
dios = false
playerName = ""
stuffValue = 6666
killAura = false
autoHeal = false

-- Local Variable --
local Players = game:service'Players'
local LocalP = Players.LocalPlayer

-- Get LocalPlayer Camera
local MyCam = workspace:FindFirstChildOfClass("Camera")
if MyCam == nil then
	warn("WHAT KIND OF BLACK MAGIC IS THIS, CAMERA NOT FOUND.")
	return
end

-- FinityUI Lib --
local Finity = loadstring(game:HttpGet("https://pastebin.com/raw/KFBs02vs"))()
local FinityWindow = Finity.new(true, "Jexytd Hub") -- 'true' dark 'false' white
FinityWindow.ChangeToggleKey(Enum.KeyCode.Insert)

-- Categories --
local c1 = FinityWindow:Category("Main")
local c2 = FinityWindow:Category("Items")
local c3 = FinityWindow:Category("Troll")
local c999 = FinityWindow:Category("Credits")

-- Credits Sector --
local s1 = c999:Sector("Finity Library Creator")
local s2 = c999:Sector("Script Creator")

-- Credits --
s1:Cheat("Label", "detourious (v3rmillion)")
s1:Cheat("Label", "deto#7612 (discord)")
s2:Cheat("Label", "QuadSquad (v3rmillion)")
s2:Cheat("Label", "Jexytd#3339 (discord)")
s2:Cheat("Label", "Discord Server (https://discord.gg/K4waTHQ)")

-- Main Sector --
local s1 = c1:Sector("AutoFarm")
local s2 = c1:Sector("Misc")
local s3 = c1:Sector("Local")

-- Items Dropdown --
local items = s1:Cheat("Dropdown", "Item", function(currentOption)
   ItemsSelect = currentOption
   wait()
   updateItemList()
end, {options = {}, default = ""})

-- Remove value duplicated in table/array --
function removeDuplicates(arr)
   local newArray = {}
   local checkerTbl = {}
   for _, element in ipairs(arr) do
       if not checkerTbl[element] then -- if there is not yet a value at the index of element, then it will be nil, which will operate like false in an if statement
           checkerTbl[element] = true
           table.insert(newArray, element)
       end
   end
   return newArray
end

-- Get Mobs and then insert to table/array --
itemA = {}
for _,tool in pairs(workspace:GetDescendants()) do
   if tool:IsA("Tool") then
       table.insert(itemA, tool.Name)
   end
end

itemB = removeDuplicates(itemA)
for i = 1, #itemB do
   items:AddOption(itemB[i])
end

function updateItemList()
   for i = 1, #itemB do
       items:RemoveOption(itemB[i])
   end
   wait()
   itemA = {}
   for _,tool in pairs(workspace:GetDescendants()) do
       if tool:IsA("Tool") then
           table.insert(itemA, tool.Name)
       end
   end

   itemB = removeDuplicates(itemA)
   for i2 = 1, #itemB do
       items:AddOption(itemB[i2])
   end
end

-- TP Speed Textbox --
local tpspeed = s1:Cheat("Textbox", "Speed TP", function(value)
   tweenSpeed = tonumber(value)
end, {placeholder = "Value"})

-- Teleport Button --
local teleport = s1:Cheat("Button", "Teleport", function()
   local Char = LocalP.Character
   for i,v in pairs(workspace:GetDescendants()) do
       if v:IsA("Tool") and v.Name == ItemsSelect then
            local tInfo = TweenInfo.new((Char.HumanoidRootPart.Position - v.Handle.Position).Magnitude / tweenSpeed, Enum.EasingStyle.Linear)
            local Tween = game:service'TweenService':Create(Char.HumanoidRootPart, tInfo, {CFrame = v.Handle.CFrame})
            Tween:Play()
            Tween.Completed:Wait(LocalP:DistanceFromCharacter(v.Handle.Position))
       end
   end
   wait()
end, {text = "Teleport"})

-- Teleport All Item Checkbox --
local tpallitems = s1:Cheat("Checkbox", "Tp All Items", function(state)
    TpAllItem = state
    while TpAllItem and wait() do
        repeat
            for i,v in pairs(workspace.Items:GetChildren()) do
                if LocalP.Character and TpAllItem == true then
                    if v:IsA("Tool") and v:FindFirstChild("Handle") then
                        local tInfo = TweenInfo.new((LocalP.Character.HumanoidRootPart.Position - v.Handle.Position).Magnitude / tweenSpeed, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 1)
                        local Tween = game:service'TweenService':Create(LocalP.Character.HumanoidRootPart, tInfo, {CFrame = v.Handle.CFrame})
                        Tween:Play()
                        Tween.Completed:Wait(LocalP:DistanceFromCharacter(v.Handle.Position))
                    end
                end
            end
            wait()
            if workspace:FindFirstChildOfClass("Tool") then
                for i,v in pairs(workspace:GetChildren()) do
                    if LocalP.Character and TpAllItem == true then
                        if v:IsA("Tool") and v:FindFirstChild("Handle") then
                            local tInfo = TweenInfo.new((LocalP.Character.HumanoidRootPart.Position - v.Handle.Position).Magnitude / tweenSpeed, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 1)
                            local Tween = game:service'TweenService':Create(LocalP.Character.HumanoidRootPart, tInfo, {CFrame = v.Handle.CFrame})
                            Tween:Play()
                            Tween.Completed:Wait(LocalP:DistanceFromCharacter(v.Handle.Position))
                        end
                    end
                end
            end
        until TpAllItem == false
    end
end)

-- Auto Kill DIO Checkbox --
local akilldio = s1:Cheat("Checkbox", "Auto Kill DIO", function(state)
    dios = state
    while dios do
        for i,v in pairs(workspace:GetChildren()) do
            if v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Name == "DIO [BOSS]" then
                if dios then
                    repeat
                        pcall(function()
                            LocalP.Character.Humanoid:ChangeState(11)
                            LocalP.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
                        end)
                        wait(.4)
                        pcall(function()
                            if LocalP.Character and LocalP.Character.Stand:FindFirstChild("Serv") then
                                local stand = LocalP.Character:FindFirstChild("Stand")
                                if stand:IsA("Model") and stand:FindFirstChild("Serv") then
                                    game:GetService("ReplicatedStorage").newremotes.CreateProjectile.hit:FireServer(v.HumanoidRootPart, 9999)
                                end
                            else
                                game:service'StarterGui':SetCore("SendNotification", {
                                    Title = "Requirements";
                                    Text = "Yoo, sorry u need a gaster to do this =)";
                                })
                                return
                            end
                        end)
                    until v.Humanoid.Health <= 0 or not v.Parent or not dios
                end
            end
        end
        wait()
    end
end)

-- Collect Money Checkbox --
local collectmoney = s1:Cheat("Checkbox", "Collect Money", function(state)
   CollectMoney = state
   while CollectMoney and wait() do
       if LocalP.Character and LocalP.Character:FindFirstChildOfClass("Tool") then
           local tool = LocalP.Character:FindFirstChildOfClass("Tool")
           if tool.Name == "Money" and tool.Equipped then
               tool:Activate()
           end
       elseif LocalP:FindFirstChild("Backpack"):FindFirstChild("Money") then
           local tool = LocalP:WaitForChild("Backpack"):FindFirstChild("Money")
           LocalP.Character.Humanoid:EquipTool(tool)
       end
   end
end)

--[[
    Sector 2 / Misc
]]

-- Noclip Checkbox --
local noclipped = s2:Cheat("Checkbox", "No-Clip", function(state)
    NoClip = state
    Stepped = game:service'RunService'.RenderStepped:Connect(function()
        if NoClip == true then
            LocalP.Character.Humanoid:ChangeState(11)
        end
        if NoClip == false then
            Stepped:Disconnect()
        end
    end)
end)

-- Item Name Esp Button
local itemesp = s2:Cheat("Checkbox", "Item Name ESP", function(state)
    local function isnil(thing)
        return (thing == nil)
    end
    local function hellno()
        for i,v in pairs(workspace.Items:GetChildren()) do
            if v:IsA("Tool") and v:FindFirstChild("Handle") then
                if not isnil(v.Handle) and not v.Handle:FindFirstChild("NameEsp") then
                    pcall(function()
                        local bbGui = Instance.new("BillboardGui")
                        bbGui.Name = "NameEsp"
                        bbGui.Parent = v.Handle
                        bbGui.Size = UDim2.new(1,200, 1,30)
                        bbGui.Adornee = v.Handle
                        bbGui.AlwaysOnTop = true
                        bbGui.Active = true
                        local Name = Instance.new("TextLabel")
                        Name.Name = "NameItem"
                        Name.Parent = bbGui
                        Name.Text = (v.Name .. " \n" .. LocalP:DistanceFromCharacter(v.Handle.Position) .. "M")
                        Name.Size = UDim2.new(1,0,1,0)
                        Name.TextYAlignment = "Top"
                        Name.TextColor3 = Color3.new(1, 1, 1)
                        Name.BackgroundTransparency = 1
                    end)
                else
                    if v.Name == "Arrow" then
                        v.Handle:FindFirstChild("NameEsp").NameItem.TextColor3 = Color3.new(245/255, 205/255, 48/255)
                    elseif v.Name == "Rokakaka Fruit" then
                        v.Handle:FindFirstChild("NameEsp").NameItem.TextColor3 = Color3.new(196/255, 40/2555, 28/255)
                    elseif v.Name == "Money" then
                        v.Handle:FindFirstChild("NameEsp").NameItem.TextColor3 = Color3.new(75/255, 200/255, 75/255)
                    elseif v.Name == "Rokakaka Fruit" then
                        v.Handle:FindFirstChild("NameEsp").NameItem.TextColor3 = Color3.new(13/255, 105/255, 172/255)
                    elseif v.Name == "Holy Diary" then
                        v.Handle:FindFirstChild("NameEsp").NameItem.TextColor3 = Color3.new(218/255, 133/255, 65/255)
                    end
                    v.Handle:FindFirstChild("NameEsp").NameItem.Text = ""
                    v.Handle:FindFirstChild("NameEsp").NameItem.Text = (v.Name .. " \n" .. LocalP:DistanceFromCharacter(v.Handle.Position) .. "M") 
                end
            end
        end
        wait(.2)
    end
    ItemEsp = state
    while ItemEsp and wait(.1) do
        if ItemEsp then
            hellno()
        else
            for _,tool in pairs(workspace.Items:GetChildren()) do
                if tool:IsA("Tool") and tool:FindFirstChild("Handle") then
                    if tool.Handle:FindFirstChild("NameEsp") then
                        local nameEsp = tool.Handle:FindFirstChild("NameEsp")
                        nameEsp:Destroy()
                    end
                end
            end
        end
    end
end)

-- Item Line Esp --
local itemlesp = s2:Cheat("Checkbox", "Item Line Esp", function(state)
    local function isnil(thing)
        return (thing == nil)
    end
    local function LoadLine()
        for i,v in pairs(workspace.Items:GetChildren()) do
            if v:IsA("Tool") and v:FindFirstChild("Handle") then
                if not isnil(v.Handle) and not v.Handle:FindFirstChild("LineEsp") then
                    pcall(function()
                        local at0 = Instance.new("Attachment")
                        at0.Parent = LocalP.Character.HumanoidRootPart
                        local at1 = Instance.new("Attachment")
                        at1.Parent = v.Handle
                        local beam0 = Instance.new("Beam")
                        beam0.Name = "LineEsp"
                        beam0.Attachment0 = at0
                        beam0.Attachment1 = at1
                        beam0.Color = ColorSequence.new(Color3.new(1,0,0),Color3.new(1,0,0))
                        beam0.Parent = v.Handle
                    end)
                end
            end
        end
        wait(.2)
    end
    LineEsp = state
    while LineEsp and wait(.1) do
        if LineEsp then
            LoadLine()
        else
            for _,tool in pairs(workspace.Items:GetChildren()) do
                if tool:IsA("Tool") and tool:FindFirstChild("Handle") then
                    if tool.Handle:FindFirstChild("LineEsp") then
                        local lineEsp = tool.Handle:FindFirstChild("LineEsp")
                        lineEsp:Destroy()
                    end
                end
            end
        end
    end
end)

-- Instant Awaken (gaster) Button --
local iawaken = s2:Cheat("Button", "Instant Awaken (Gaster)", function()
    if LocalP.Character and LocalP.Character.Stand:FindFirstChild("Serv") then
        local stand = LocalP.Character:FindFirstChild("Stand")
        if stand:IsA("Model") and stand:FindFirstChild("Serv") then
            local awakenRemote = stand.Serv.awaken
            awakenRemote:FireServer(LocalP.Character.Humanoid)
            wait(.2)
            repeat wait(.6)
                game:GetService("ReplicatedStorage").newremotes.CreateProjectile.hit:FireServer(LocalP.Character.HumanoidRootPart, -9)
            until LocalP.Character.Humanoid.Health <= 0
        end
    else
        game:service'StarterGui':SetCore("SendNotification", {
            Title = "Requirements";
            Text = "Yoo, sorry u need a gaster to do this =)";
        })
        return
    end
end, {text = "Awaken"})

-- Destroy Gui Button
local disabled = s2:Cheat("Button", "Destroy Gui", function()
   if game:service'CoreGui':FindFirstChild("FinityUI") then game:service'CoreGui':FindFirstChild("FinityUI"):Destroy() end
   return
end, {text = "Destroy Gui"})

--[[
   Sector 3 / Local Sector
]]

-- Walkspeed value slider --
local wsVal = s3:Cheat("Slider", "Walkspeed Value", function(Value)
speedVal = Value
end, {min = 16, max = 200, suffix = ""})

-- Jumppower value slider --
local jpVal = s3:Cheat("Slider", "JumpPower Value", function(Value)
jpValue = Value
end, {min = 16, max = 200, suffix = ""})

-- WalkSpeed Checkbox --
local ws = s3:Cheat("Checkbox", "Walkspeed", function(state)
   wSpeed = state
   if wSpeed then
       if speedVal == nil then speedVal = 30 end
       LocalP.Character.Humanoid.WalkSpeed = speedVal
   else
       LocalP.Character.Humanoid.WalkSpeed = 16  
   end
end)

-- JumpPower Checkbox --
local ws = s3:Cheat("Checkbox", "JumpPower", function(state)
   jPower = state
   if jPower then
       if jpValue == nil then jpValue = 30 end
       LocalP.Character.Humanoid.JumpPower = jpValue
   else
       LocalP.Character.Humanoid.JumpPower = 50
   end
end)

--[[
    Category 2 / Items Sector
]]

-- Main Sector --
local s1 = c2:Sector("Teleport")
local s2 = c2:Sector("Sell")

-- TP Speed Textbox --
local tpspeed2 = s1:Cheat("Textbox", "Speed TP", function(value)
    tweenSpeed2 = tonumber(value)
 end, {placeholder = "Value"})

 local itemname = s1:Cheat("Textbox", "Item Name", function(value)
    NameItems = tostring(value)
 end, {placeholder = "Name"})

  -- Teleport Arrow Checkbox --
local tpcertainitems = s1:Cheat("Checkbox", "Teleport", function(state)
    TPCertainItems = state
    while TPCertainItems do
        repeat
            for i,v in pairs(workspace.Items:GetChildren()) do
                if LocalP.Character and TPCertainItems == true then
                    if v:IsA("Tool") and v:FindFirstChild("Handle") and string.find(v.Name, NameItems) and not NameItems == "" then
                        local tInfo = TweenInfo.new((LocalP.Character.HumanoidRootPart.Position - v.Handle.Position).Magnitude / tweenSpeed2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 1)
                        local Tween = game:service'TweenService':Create(LocalP.Character.HumanoidRootPart, tInfo, {CFrame = v.Handle.CFrame})
                        Tween:Play()
                        Tween.Completed:Wait(LocalP:DistanceFromCharacter(v.Handle.Position))
                    end
                end
            end
            wait()
            if workspace:FindFirstChildOfClass("Tool") then
                for i,v in pairs(workspace:GetChildren()) do
                    if LocalP.Character and TPCertainItems == true then
                        if v:IsA("Tool") and v:FindFirstChild("Handle") and string.find(v.Name, NameItems) and not NameItems == "" then
                            local tInfo = TweenInfo.new((LocalP.Character.HumanoidRootPart.Position - v.Handle.Position).Magnitude / tweenSpeed2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 1)
                            local Tween = game:service'TweenService':Create(LocalP.Character.HumanoidRootPart, tInfo, {CFrame = v.Handle.CFrame})
                            Tween:Play()
                            Tween.Completed:Wait(LocalP:DistanceFromCharacter(v.Handle.Position))
                        end
                    end
                end
            end
        until TPCertainItems == false
    end
 end)

 -- Teleport Arrow Checkbox --
local tparrow = s1:Cheat("Checkbox", "Tp Arrow", function(state)
    ArrowTp = state
    while ArrowTp do
        repeat
            for i,v in pairs(workspace.Items:GetChildren()) do
                if LocalP.Character and ArrowTp == true then
                    if v:IsA("Tool") and v:FindFirstChild("Handle") and v.Name == "Arrow" then
                        local tInfo = TweenInfo.new((LocalP.Character.HumanoidRootPart.Position - v.Handle.Position).Magnitude / tweenSpeed2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 1)
                        local Tween = game:service'TweenService':Create(LocalP.Character.HumanoidRootPart, tInfo, {CFrame = v.Handle.CFrame})
                        Tween:Play()
                        Tween.Completed:Wait(LocalP:DistanceFromCharacter(v.Handle.Position))
                    end
                end
            end
            wait()
        until ArrowTp == false
    end
 end)

  -- Teleport Roka Checkbox --
local rokatp = s1:Cheat("Checkbox", "Tp Rokakaka Fruit", function(state)
    local Char = LocalP.Character
    RokaTp = state
    while RokaTp do
        repeat
            for i,v in pairs(workspace.Items:GetChildren()) do
                if LocalP.Character and RokaTp == true then
                    if v:IsA("Tool") and v:FindFirstChild("Handle") and v.Name == "Rokakaka Fruit" then
                        local tInfo = TweenInfo.new((LocalP.Character.HumanoidRootPart.Position - v.Handle.Position).Magnitude / tweenSpeed2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 1)
                        local Tween = game:service'TweenService':Create(LocalP.Character.HumanoidRootPart, tInfo, {CFrame = v.Handle.CFrame})
                        Tween:Play()
                        Tween.Completed:Wait(LocalP:DistanceFromCharacter(v.Handle.Position))
                    end
                end
            end
            wait()
        until RokaTp == false
    end
 end)

-- Teleport Money Checkbox --
local moneytp = s1:Cheat("Checkbox", "Tp Money", function(state)
    local Char = LocalP.Character
    MoneyTp = state
    while MoneyTp do
        repeat
            for i,v in pairs(workspace.Items:GetChildren()) do
                if LocalP.Character and MoneyTp == true then
                    if v:IsA("Tool") and v:FindFirstChild("Handle") and v.Name == "Money" then
                        local tInfo = TweenInfo.new((LocalP.Character.HumanoidRootPart.Position - v.Handle.Position).Magnitude / tweenSpeed2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 1)
                        local Tween = game:service'TweenService':Create(LocalP.Character.HumanoidRootPart, tInfo, {CFrame = v.Handle.CFrame})
                        Tween:Play()
                        Tween.Completed:Wait(LocalP:DistanceFromCharacter(v.Handle.Position))
                    end
                end
            end
            wait()
        until MoneyTp == false
    end
 end)

 -- Teleport Dio's Diary Checkbox --
local diodiarytp = s1:Cheat("Checkbox", "Tp Dio's Diary", function(state)
    local Char = LocalP.Character
    DioDiaryTp = state
    while DioDiaryTp do
        repeat
            for i,v in pairs(workspace.Items:GetChildren()) do
                if LocalP.Character and DioDiaryTp == true then
                    if v:IsA("Tool") and v:FindFirstChild("Handle") and v.Name == "DIO's Diary" then
                        local tInfo = TweenInfo.new((LocalP.Character.HumanoidRootPart.Position - v.Handle.Position).Magnitude / tweenSpeed2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 1)
                        local Tween = game:service'TweenService':Create(LocalP.Character.HumanoidRootPart, tInfo, {CFrame = v.Handle.CFrame})
                        Tween:Play()
                        Tween.Completed:Wait(LocalP:DistanceFromCharacter(v.Handle.Position))
                    end
                end
            end
            wait()
        until DioDiaryTp == false
    end
 end)

  -- Teleport Holy Diary Checkbox --
local holydiarytp = s1:Cheat("Checkbox", "Tp Holy Diary", function(state)
    local Char = LocalP.Character
    HolyDiaryTp = state
    while HolyDiaryTp do
        for i,v in pairs(workspace.Items:GetChildren()) do
            if LocalP.Character and HolyDiaryTp == true then
                if v:IsA("Tool") and v:FindFirstChild("Handle") and v.Name == "Holy Diary" then
                    local tInfo = TweenInfo.new((LocalP.Character.HumanoidRootPart.Position - v.Handle.Position).Magnitude / tweenSpeed2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 1)
                    local Tween = game:service'TweenService':Create(LocalP.Character.HumanoidRootPart, tInfo, {CFrame = v.Handle.CFrame})
                    Tween:Play()
                    Tween.Completed:Wait(LocalP:DistanceFromCharacter(v.Handle.Position))
                end
            end
        end
        wait()
    end
 end)

   -- Teleport Holy Diary Checkbox --
local watchtp = s1:Cheat("Checkbox", "Tp Watch", function(state)
    local Char = LocalP.Character
    WatchTp = state
    while WatchTp do
        repeat
            for i,v in pairs(workspace.Items:GetChildren()) do
                if LocalP.Character and WatchTp == true then
                    if v:IsA("Tool") and v:FindFirstChild("Handle") and v.Name == "Watch" then
                        local tInfo = TweenInfo.new((LocalP.Character.HumanoidRootPart.Position - v.Handle.Position).Magnitude / tweenSpeed2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 1)
                        local Tween = game:service'TweenService':Create(LocalP.Character.HumanoidRootPart, tInfo, {CFrame = v.Handle.CFrame})
                        Tween:Play()
                        Tween.Completed:Wait(LocalP:DistanceFromCharacter(v.Handle.Position))
                    end
                end
            end
            wait()
        until WatchTp == false
    end
 end)

 --[[
     Sector 2 / Sell Sector
 ]]

 -- AutoSellArrow Checkbox --
local asellarrow = s2:Cheat("Checkbox", "Auto-Sell Arrow", function(state)
    local Char = LocalP.Character
    SellArrow = state
    while SellArrow and wait(.1) do
        if LocalP:FindFirstChild("Backpack").ChildAdded and LocalP.Backpack:FindFirstChild("Arrow") then
            game:GetService("ReplicatedStorage").newremotes.SellItem:FireServer("Arrow")
        end
    end
 end)
 
 -- AutoSellRokaka Checkbox --
 local asellroka = s2:Cheat("Checkbox", "Auto-Sell Rokaka", function(state)
    local Char = LocalP.Character
    SellRoka = state
    while SellRoka and wait(.1) do
        if LocalP:FindFirstChild("Backpack").ChildAdded and LocalP.Backpack:FindFirstChild("Rokakaka Fruit") then
            game:GetService("ReplicatedStorage").newremotes.SellItem:FireServer("Rokakaka Fruit")
        end
    end
 end)
 
 -- AutoSellReqArrow Checkbox --
 local asellreqarrow = s2:Cheat("Checkbox", "Auto-Sell ReqArrow", function(state)
    local Char = LocalP.Character
    SellReqArrow = state
    while SellReqArrow and wait(.1) do
        if LocalP:FindFirstChild("Backpack").ChildAdded and LocalP.Backpack:FindFirstChild("Requiem Arrow") then
            game:GetService("ReplicatedStorage").newremotes.SellItem:FireServer("Requiem Arrow")
        end
    end
 end)

  -- AutoSellGifGods Checkbox --
  local asellgodgifts = s2:Cheat("Checkbox", "Auto-Sell God Gifts", function(state)
    local Char = LocalP.Character
    SellGodGifts = state
    while SellGodGifts and wait(.1) do
        if LocalP:FindFirstChild("Backpack").ChildAdded and LocalP.Backpack:FindFirstChild("Gift From The Gods") then
            game:GetService("ReplicatedStorage").newremotes.SellItem:FireServer("Gift From The Gods")
        end
    end
 end)

  -- AutoSellDioDiary Checkbox --
  local asellreqarrow = s2:Cheat("Checkbox", "Auto-Sell Dio Diary", function(state)
    local Char = LocalP.Character
    SellReqArrow = state
    while SellReqArrow and wait(.1) do
        if LocalP:FindFirstChild("Backpack").ChildAdded and LocalP.Backpack:FindFirstChild("DIO's Diary") then
            game:GetService("ReplicatedStorage").newremotes.SellItem:FireServer("DIO's Diary")
        end
    end
 end)

  -- AutoSellHolyDiary Checkbox --
  local asellgodgifts = s2:Cheat("Checkbox", "Auto-Sell Holy Diary", function(state)
    local Char = LocalP.Character
    SellGodGifts = state
    while SellGodGifts and wait(.1) do
        if LocalP:FindFirstChild("Backpack").ChildAdded and LocalP.Backpack:FindFirstChild("Holy Diary") then
            game:GetService("ReplicatedStorage").newremotes.SellItem:FireServer("Holy Diary")
        end
    end
 end)

--[[
    Category 3 / Troll
]]

-- Troll Sector --
local s1 = c3:Sector("Stuff 1")
local s2 = c3:Sector("Stuff 2")
local s3 = c3:Sector("Stuff 3")

-- Player name textbox --
local nubname = s1:Cheat("Textbox", "Player Name", function(value)
    playerName = value
end, {placeholder = "Name"})

-- Value textbox --
local nubvalue = s1:Cheat("Textbox", "Value", function(value)
    stuffValue = tonumber(value)
end, {placeholder = "Value"})

-- Kill button --
local killplr = s1:Cheat("Button", "Kill Player", function()
    for _,plr in pairs(Players:GetChildren()) do
        if string.find(plr.Name, tostring(playerName)) then
            if LocalP.Character and LocalP.Character.Stand:FindFirstChild("Serv") then
                local stand = LocalP.Character:FindFirstChild("Stand")
                if stand:IsA("Model") and stand:FindFirstChild("Serv") then
                    game:GetService("ReplicatedStorage").newremotes.CreateProjectile.hit:FireServer(plr.Character.HumanoidRootPart, stuffValue)
                end
            else
                game:service'StarterGui':SetCore("SendNotification", {
                    Title = "Requirements";
                    Text = "Yoo, sorry u need a gaster to do this =)";
                })
            end
        end
    end
end, {text = "Kill"})

-- Heal button --
local healplr = s1:Cheat("Button", "Heal Player", function()
    for _,plr in pairs(Players:GetChildren()) do
        if string.find(plr.Name, tostring(playerName)) then
            if LocalP.Character and LocalP.Character.Stand:FindFirstChild("Serv") then
                local stand = LocalP.Character:FindFirstChild("Stand")
                if stand:IsA("Model") and stand:FindFirstChild("Serv") then
                    game:GetService("ReplicatedStorage").newremotes.CreateProjectile.hit:FireServer(plr.Character.HumanoidRootPart, -stuffValue)
                end
            else
                game:service'StarterGui':SetCore("SendNotification", {
                    Title = "Requirements";
                    Text = "Yoo, sorry u need a gaster to do this =)";
                })
            end
        end
    end
end, {text = "Heal"})

-- Kill All button --
local killall = s2:Cheat("Button", "Kill all", function()
    for _,plr in pairs(Players:GetChildren()) do
        if plr.Name ~= LocalP.Name then
            if LocalP.Character and LocalP.Character.Stand:FindFirstChild("Serv") then
                local stand = LocalP.Character:FindFirstChild("Stand")
                if stand:IsA("Model") and stand:FindFirstChild("Serv") then
                    game:GetService("ReplicatedStorage").newremotes.CreateProjectile.hit:FireServer(plr.Character.HumanoidRootPart, 9999)
                end
            else
                game:service'StarterGui':SetCore("SendNotification", {
                    Title = "Requirements";
                    Text = "Yoo, sorry u need a gaster to do this =)";
                })
            end
        end
    end
end, {text = "Kill All"})

-- Heal All button --
local healall = s2:Cheat("Button", "Heal all", function()
    for _,plr in pairs(Players:GetChildren()) do
        if LocalP.Character and LocalP.Character.Stand:FindFirstChild("Serv") then
            local stand = LocalP.Character:FindFirstChild("Stand")
            if stand:IsA("Model") and stand:FindFirstChild("Serv") then
                game:GetService("ReplicatedStorage").newremotes.CreateProjectile.hit:FireServer(plr.Character.HumanoidRootPart, -9999)
            end
        else
            game:service'StarterGui':SetCore("SendNotification", {
                Title = "Requirements";
                Text = "Yoo, sorry u need a gaster to do this =)";
            })
        end
    end
end, {text = "Heal All"})

-- Lag all button --
local lagall = s2:Cheat("Button", "Lag all", function()
    for i = 1, 1000 do -- HUH change that number to dunno
        for i,v in pairs(game.Players:GetChildren()) do
            if v.Name ~= game.Players.LocalPlayer.Name then
                game:service'ReplicatedStorage'.KnockAdvanced:FireServer(v.Character.Humanoid)
            end
        end
    end
end, {text = "Lag All"})

-- Anti TS Checkbox --
local antits = s3:Cheat("Checkbox", "Anti-TS", function(state)
    AntiTS = state
    while AntiTS and wait() do
        if game:service'Lighting'.ChildAdded then
            if game:service'Lighting'.TS.Changed then
                game:service'Lighting'.TS.Value = false
            end
            if game:service'Lighting':FindFirstChild("sakts") then
                game:service'Lighting':FindFirstChild("sakts").Value = false
            end
        end
    end
end)

-- Kill Aura Checkbox --
local kaura = s3:Cheat("Checkbox", "Kill Aura", function(state)
    killAura = state
    while killAura and wait(.1) do
        for _,plr in pairs(Players:GetChildren()) do
            if plr.Name ~= LocalP.Name and LocalP:DistanceFromCharacter(plr.Character.HumanoidRootPart.Position) < 70 then
                if LocalP.Character and LocalP.Character.Stand:FindFirstChild("Serv") then
                    local stand = LocalP.Character:FindFirstChild("Stand")
                    if stand:IsA("Model") and stand:FindFirstChild("Serv") then
                        game:GetService("ReplicatedStorage").newremotes.CreateProjectile.hit:FireServer(plr.Character.HumanoidRootPart, 9999)
                    end
                else
                    game:service'StarterGui':SetCore("SendNotification", {
                        Title = "Requirements";
                        Text = "Yoo, sorry u need a gaster to do this =)";
                    })
                    return
                end
            end
        end
        wait()
    end
end)

-- Auto heal Checkbox --
local aheal = s3:Cheat("Checkbox", "Auto Heal", function(state)
    autoHeal = state
    while autoHeal and wait(.3) do
        if LocalP.Character.Humanoid.Health < LocalP.Character.Humanoid.MaxHealth then
            if LocalP.Character and LocalP.Character.Stand:FindFirstChild("Serv") then
                local stand = LocalP.Character:FindFirstChild("Stand")
                if stand:IsA("Model") and stand:FindFirstChild("Serv") then
                    game:GetService("ReplicatedStorage").newremotes.CreateProjectile.hit:FireServer(LocalP.Character.HumanoidRootPart, -9999)
                end
            else
                game:service'StarterGui':SetCore("SendNotification", {
                    Title = "Requirements";
                    Text = "Yoo, sorry u need a gaster to do this =)";
                })
                return
            end
        end
        wait()
    end
end)

-- yeet
wait(.3)
local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   print'[Anti-Afk] OwO you idled a second ago.'
end)
wait(.2)
warn'Anti-AFK is running!'
while true and wait() do
   if not game:service'CoreGui':FindFirstChild("FinityUI") then
       return
   end
end

local l__ReplicatedStorage__1 = game:GetService("ReplicatedStorage");
local v3 = require(l__ReplicatedStorage__1.Modules.Load);
local u8 = v3("UIHandler", true);
				u8:GiveNotification({
					text = "Wild West GUI - Lace", 
					textcolor = "Green", 
					center = true
				});

shared.penisland = false

local acc1uracy = nil
local penis = 16
local penis2 = 60

function hitbox(v)
    if shared.hitbox == true then
    if v.Name ~= game.Players.LocalPlayer.Name then
    if v.Character:FindFirstChild('Head') then
        local Head = v.Character:FindFirstChild('Head')
        Head.CanCollide = false
        Head.Size = Vector3.new(20, 20, 20)
        Head.Transparency = 0.35
         Head.CanCollide = false
             elseif toggle == false then 
        toggle = true
        Head.Size = Vector3.new(1,1,1)
        Head.Transparency = 0
        Head.CanCollide = true
        print(toggle)
             end
end
end
end



local me = game.Players.LocalPlayer.Name
  
ores = {
     "CoalOre";
     "CopperOre";
     'ZincOre';
     'IronOre';
     'SilverOre';
     'GoldOre';
 }
 
local mine = game:GetService("Workspace")["WORKSPACE_Interactables"].Mining.OreDeposits
local mee = Instance.new("Attachment")

mee.Parent = game:GetService("Workspace")["WORKSPACE_Entities"].Players[me].Head

local function createESP(primary)
local bill = Instance.new("BillboardGui", primary)
local name = Instance.new("TextLabel", bill)
local box = Instance.new("BoxHandleAdornment", primary)
  box.Adornee = primary
  box.AlwaysOnTop = true
  box.Color = primary.BrickColor
  box.ZIndex = 10
  box.Size = primary.Size+Vector3.new(0.1,0.1,0.1)

bill.AlwaysOnTop = false
bill.Size = UDim2.new(0,50,0,10)
name.Size = UDim2.new(0,50,0,10)
name.BackgroundTransparency = 1
name.Text = bill.Parent.Name
name.TextColor3 = Color3.new(255,0,0)
name.Font = Enum.Font.SciFi
name.TextStrokeTransparency = 0
name.TextScaled = true
local bill = Instance.new("BillboardGui", primary)
local name = Instance.new("TextLabel", bill)
local box = Instance.new("BoxHandleAdornment", primary)
  box.Adornee = primary
  box.AlwaysOnTop = false
  box.Color = primary.BrickColor
  box.ZIndex = 10
  box.Size = primary.Size+Vector3.new(0.1,0.1,0.1)

bill.AlwaysOnTop = true
bill.Size = UDim2.new(0,50,0,10)
name.Size = UDim2.new(0,50,0,10)
name.BackgroundTransparency = 1
name.Text = bill.Parent.Name
name.TextColor3 = primary.Color
name.Font = Enum.Font.SciFi
name.TextStrokeTransparency = 1
name.TextScaled = true

end

function esp(p)
    if shared.toggle == true then
    
        local char = p.Character
        if char then
          text = char.Name
          item = char.Head
          local BillboardGui = Instance.new("BillboardGui")
      local TextLabel = Instance.new("TextLabel")
      BillboardGui.Parent = item
      BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
      BillboardGui.Active = true
      BillboardGui.AlwaysOnTop = true
      BillboardGui.LightInfluence = 1
      BillboardGui.Size = UDim2.new(0, 100, 0, 50)
      BillboardGui.StudsOffset = Vector3.new(0, 2.5, 0)
      TextLabel.Parent = BillboardGui
      TextLabel.BackgroundColor3 = Color3.new(1, 1, 1)
      TextLabel.BackgroundTransparency = 1
      TextLabel.Size = UDim2.new(0, 100, 0, 50)
      TextLabel.Font = Enum.Font.SourceSans
      TextLabel.Text = text
      TextLabel.TextColor3 = p.TeamColor.Color
      TextLabel.TextScaled = false
      TextLabel.TextSize = 20
      TextLabel.TextWrapped = false
      end
    end
    end
    
    -- getplayer
    local function getPlayerFromCharacter(character)
        for _, player in pairs(game:GetService("Players"):GetPlayers()) do
            if player.Character == character then
                return player
            end
        end
    end
    
    -- esp hooks
    
    
    local library = loadstring(game:HttpGet(('https://pastebin.com/raw/UB1qQiRj')))() -- It's obfuscated, I won't let you see my ugly coding skills. =)
    
    local w = library:CreateWindow("Wild West GUI - Lace")
    
    local b = w:CreateFolder("ESP")
    
    b:Label("IF ESP BUGS UNTOGGLE THEN RETOGGLE",Color3.fromRGB(38,38,38),Color3.fromRGB(0,216,111)) --BgColor,TextColor
    
    
    
    b:Toggle("Player ESP",function(bool)
        shared.toggle = bool
        if shared.toggle == true then
            for i,v in pairs(game.Players:GetPlayers()) do
        esp(v)
            end
        end
        
    if shared.toggle == false then
    for i,v in pairs(game:GetService("Workspace")["WORKSPACE_Entities"].Players:GetDescendants()) do
        if v.Name == "BillboardGui" then
          v:Destroy()  
        end
    end
    end
    
    game.Players.PlayerAdded:Connect(function(player)
    if shared.toggle == true then
    esp(player)
    end
    end)
    
    for i,v in pairs(game.Players:GetPlayers()) do
    v.CharacterAdded:Connect(function(player)
        if shared.toggle == true then
    esp(getPlayerFromCharacter(player))
    end
    end)
    end
        
    end)
    
    b:Toggle("Animal ESP",function(bool)
        shared.bruh = bool
        print(shared.bruh)
    end)

    b:Toggle("Ore ESP",function(bool)
        shared.nigger1 = bool
        print(shared.nigger1)
        if shared.nigger1 == true then
        for _,v in pairs(mine:GetDescendants()) do
            for _,c in pairs(ores) do
          
                    if string.match(v.Name, c) then
                        createESP(v)
                    else
                       
                    end
                end
            end
    elseif shared.nigger1 == false then
        for i,v in pairs(mine:GetDescendants()) do
            if v.Name == "BillboardGui"then
                v:Destroy()
    end
        end
        for k,l in pairs(mine:GetDescendants()) do
            if l.Name == "BoxHandleAdornment" then
                l.Adornee = game.Workspace
                l:Destroy()
    end
    end
    end
end)
    
local b = w:CreateFolder("Hitboxes")
    
b:Label("IF HITBOXES BUGS UNTOGGLE THEN RETOGGLE",Color3.fromRGB(38,38,38),Color3.fromRGB(0,216,111)) --BgColor,TextColor

b:Toggle("Player Hitboxes",function(bool)
    shared.hitbox = bool
    print(shared.hitbox)
    if shared.hitbox == true then
        for i,v in pairs(game:GetService("Workspace")["WORKSPACE_Entities"].Players:GetChildren()) do
            hitbox(game.Players[v.Name])
            end 
    elseif shared.hitbox == false then
        for k,v in next, game:GetService('Players'):GetPlayers() do
            if v.Name ~= game.Players.LocalPlayer.Name then
                if v.Character:FindFirstChild('Head') then
                    local Head = v.Character:FindFirstChild('Head')
                    Head.Size = Vector3.new(1,1,1)
                    Head.Transparency = 0
                    Head.CanCollide = true
                end
            end
        end
    end
end)

b:Toggle("Animal Hitboxes",function(bool)
    shared.anmh = bool
    print(shared.anmh)
    if shared.anmh == true then
        for i,v in pairs(game:GetService("Workspace")["WORKSPACE_Entities"].Animals:GetChildren()) do
            if v:FindFirstChild('Body') then
                local Head = v:FindFirstChild('Body')
                Head.CanCollide = false
                Head.Size = Vector3.new(20, 20, 20)
                Head.Transparency = 0.35
                 Head.CanCollide = false
        end
        end
    elseif shared.anmh == false then
                for i,v in pairs(game:GetService("Workspace")["WORKSPACE_Entities"].Animals:GetChildren()) do
        if v:FindFirstChild('Body') then
            local Head = v:FindFirstChild('Body')
            Head.CanCollide = true
            Head.Size = Vector3.new(2, 3, 5)
            Head.Transparency = 0
        end
end
end
end)
local b = w:CreateFolder("Weapon Mods")

b:Button("Amazing Accuracy",function()
for i, v in pairs(getgc(true)) do
   if type(v) == "table" and rawget(v, "BaseRecoil") then
	   v.ProjectileAccuracy = 100
   end
end
end)


b:Button("No Recoil",function()
for i,v in next, require(game.ReplicatedStorage.Modules.Load.Character.Items.Types.GunItem) do
    if i == "CalculateRecoil" then
        hookfunction(v, function()
            return 0
        end)
    end
end
end)

b:Button("Wallbang",function()
for i, v in pairs(getgc(true)) do
   if type(v) == "table" and rawget(v, "BaseRecoil") then
	   	   v.ProjectilePenetration = math.huge
   end
end
end)


b:Button("Fast Gun",function()
for i, v in pairs(getgc(true)) do
   if type(v) == "table" and rawget(v, "BaseRecoil") then
	   v.FireSpeed = 0
   end
   end
end)


local b = w:CreateFolder("Player Mods")
b:Slider("WalkSpeed",100,function(value) --MaxValue
penis = value
end)
b:Slider("JumpPower",200,function(value) --MaxValue
penis2 = value
end)
b:Slider("HipHeight",100,function(value) --MaxValue
game.Players.LocalPlayer.Character.Humanoid.HipHeight = tonumber(value)
end)
local b = w:CreateFolder("Misc")
b:Button("Fullbright",function()
shared.penisland = true
end)

b:DestroyGUI()
    while wait(0.5) do
        if shared.bruh == true then
        for i,v in pairs(game:GetService("Workspace")["WORKSPACE_Entities"].Animals:GetChildren()) do
            if v:FindFirstChild('HumanoidRootPart') ~= nil then
            if v.HumanoidRootPart:FindFirstChild('BillboardGui') == nil then
            local char = v  
        if char then
          text = char.Name
          if char:WaitForChild("HumanoidRootPart") ~= nil then
          item = char.HumanoidRootPart
          local BillboardGui = Instance.new("BillboardGui")
      local TextLabel = Instance.new("TextLabel")
      BillboardGui.Parent = item
      BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
      BillboardGui.Active = true
      BillboardGui.AlwaysOnTop = true
      BillboardGui.LightInfluence = 1
      BillboardGui.Size = UDim2.new(0, 100, 0, 50)
      BillboardGui.StudsOffset = Vector3.new(0, 2.5, 0)
      TextLabel.Parent = BillboardGui
      TextLabel.BackgroundColor3 = Color3.new(1, 1, 1)
      TextLabel.BackgroundTransparency = 1
      TextLabel.Size = UDim2.new(0, 100, 0, 50)
      TextLabel.Font = Enum.Font.SourceSans
      TextLabel.Text = text
      TextLabel.TextColor3 = char.Body.Color
      TextLabel.TextScaled = false
      TextLabel.TextSize = 20
      TextLabel.TextWrapped = false
      end
    end
    end
    end
end
elseif shared.bruh == false then
for i,v in pairs(game:GetService("Workspace")["WORKSPACE_Entities"].Animals:GetDescendants()) do
    if v.Name == "BillboardGui" then
      v:Destroy()  
    end
end
end
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = tonumber(penis)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = tonumber(penis2)
    
    if shared.penisland == true then
                	game:GetService("Lighting").Brightness = 2
    	game:GetService("Lighting").ClockTime = 14
    	game:GetService("Lighting").FogEnd = 100000
    	game:GetService("Lighting").GlobalShadows = false
    	game:GetService("Lighting").OutdoorAmbient = Color3.fromRGB(128, 128, 128)
    	end
end

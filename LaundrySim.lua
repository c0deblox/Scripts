repeat wait()
   until game.ReplicatedStorage

local remote = game.ReplicatedStorage.Events.RemoteEvent

local what
what = hookfunction(getrawmetatable(game).__namecall, function(self, ...)
   if self == remote and getnamecallmethod() == "FireServer" then
       return wait(9e9)
   end
   return what(self, ...)
end)

local me = game.Players.LocalPlayer

for i,v in pairs(me.Gamepasses:GetChildren()) do
   v.Value = true
end

me.NonSaveVars.TempCoinBoost.Value = true

local VirtualUser = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
VirtualUser:CaptureController()
VirtualUser:ClickButton2(Vector2.new())
end)

local GUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/SkiddDev/UI-Librarys/main/Wallys-UI-Library"))()
local home = GUI:CreateWindow("JoshMods#3657")

local EventList = game.ReplicatedStorage:WaitForChild("Events");
local v4 = require(game.ReplicatedStorage.Modules.Rep_Library);

local pLocal = game.Players.LocalPlayer;
local clothings = game.Workspace.Debris.Clothing;
local plots = game.Workspace.Plots:GetChildren();
local yourPlot = nil;
local first = true;

print("\n\n\n\n\n\n\n")
print("Starting Auto Farm!")
print("Display Name: " .. pLocal.DisplayName)
while (yourPlot == nil) do
    for i=1, #plots do
        if tostring(plots[i].Owner.Value) == pLocal.DisplayName then yourPlot = plots[i] end
    end
    if first and yourPlot == nil then
        v4.notify(pLocal, "Please claim a plot to load the script.");
        first = false    
    end
    wait(0.5)
end
print("My plot is: " .. tostring(yourPlot.Name))

local machines = yourPlot.WashingMachines;

function Teleport(cCframe)
    pLocal.Character.HumanoidRootPart.CFrame = CFrame.new(cCframe.x, cCframe.y + 5, cCframe.z)
end

function GetBestClothing()
    local clothes = clothings:GetChildren()
    local tiers = {
    	Silver = {
    		Multiplier = 3, 
    		UIColour = Color3.fromRGB(161, 161, 161)
    	}, 
    	Gold = {
    		Multiplier = 10, 
    		UIColour = Color3.fromRGB(255, 170, 0)
    	}, 
    	Emerald = {
    		Multiplier = 25, 
    		UIColour = Color3.fromRGB(18, 236, 6)
    	}, 
    	Ruby = {
    		Multiplier = 25, 
    		UIColour = Color3.fromRGB(239, 0, 0)
    	}, 
    	Sapphire = {
    		Multiplier = 25, 
    		UIColour = Color3.fromRGB(79, 215, 255)
    	}
    }
    local topMultiplier = 1
    local topClothing = nil
    for i=1, #clothes do
        local clothing = clothes[i]:FindFirstChildOfClass("StringValue")
        if clothing ~= nil then
            if tiers[clothing.Value].Multiplier == 25 then return clothes[i] end
            if topMultiplier < tiers[clothing.Value].Multiplier then 
                topClothing = clothes[i] 
                topMultiplier = tiers[clothing.Value].Multiplier
            end
        end
    end
    if topClothing == nil then return clothings:FindFirstChildOfClass("MeshPart") end
    return topClothing
end

function FillBasket()
    local timesToLoop = pLocal.NonSaveVars.TotalWashingMachineCapacity.Value - pLocal.NonSaveVars.BackpackAmount.Value
    if timesToLoop > pLocal.NonSaveVars.BasketSize.Value then timesToLoop = pLocal.NonSaveVars.BasketSize.Value end
    
    while pLocal.NonSaveVars.BackpackAmount.Value ~= pLocal.NonSaveVars.TotalWashingMachineCapacity.Value and pLocal.NonSaveVars.BackpackAmount.Value ~= pLocal.NonSaveVars.BasketSize.Value do
        local clothingPart = GetBestClothing()
        if clothingPart == nil then clothingPart = clothings:FindFirstChildOfClass("MeshPart") end
        
        if clothingPart ~= nil then
            Teleport(clothingPart.CFrame)
            EventList.GrabClothing:FireServer(clothingPart);
        end
        wait(0.11)
    end
end

function LoadWashers()
    local washers = machines:GetChildren();
    for i=1, #washers do
        local thisWasher = washers[i];
        local capacity = thisWasher.Config.Capacity.Value;
        if not thisWasher.Config.Started.Value then
            FillBasket()
            Teleport(thisWasher.Parts.Part.CFrame)
            wait(0.1)
            game.ReplicatedStorage.Events.LoadWashingMachine:FireServer(thisWasher);
        end
    end
end

function ClearWashers()
    local washers = machines:GetChildren();
    for i=1, #washers do
        local thisWasher = washers[i];
        if thisWasher.Config.CycleFinished.Value then
            Teleport(thisWasher.Parts.Part.CFrame)
            game.ReplicatedStorage.Events.UnloadWashingMachine:FireServer(thisWasher);
            wait(0.5)
            Teleport(game.Workspace._FinishChute.Hinge.CFrame)
            wait(0.1)
            EventList.DropClothesInChute:FireServer();
        end
    end
end

function OpenShop()
    Teleport(game.Workspace.ArchysShopEntrance.Open.CFrame - Vector3.new(0,5,0))
end

home:Button('Fill Washers', LoadWashers)
home:Button('Clear Washers', ClearWashers)
home:Button('Open Shop', OpenShop)
home:Toggle('Auto Farm', {flag = "fullAuto"})
home:Toggle('Pause Refill', {flag = "pauseRefill"})

while true do
    if home.flags.fullAuto and not pLocal.PlayerGui.EditMode.Frame.Visible then
        local washers = machines:GetChildren();
        for i=1, #washers do
            local thisWasher = washers[i];
            if pLocal.NonSaveVars.BasketStatus.Value == "Clean" and pLocal.NonSaveVars.BackpackAmount.Value > 0 then
                Teleport(game.Workspace._FinishChute.Hinge.CFrame)
                EventList.DropClothesInChute:FireServer();
            elseif thisWasher.Config.CycleFinished.Value then
                if pLocal.NonSaveVars.BackpackAmount.Value == 0 or pLocal.NonSaveVars.BasketStatus.Value == "Clean" then
                    Teleport(thisWasher.Parts.Part.CFrame)
                    game.ReplicatedStorage.Events.UnloadWashingMachine:FireServer(thisWasher);
                end
            elseif thisWasher.Config.Started.Value == false and not home.flags.pauseRefill then
                FillBasket()
                wait(0.1)
                Teleport(thisWasher.Parts.Part.CFrame)
                game.ReplicatedStorage.Events.LoadWashingMachine:FireServer(thisWasher);
            end
        end
    end
    wait(0.06)
end
